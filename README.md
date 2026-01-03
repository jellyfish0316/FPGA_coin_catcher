# Coin Catcher FPGA Game

## 一、實作目標

本專案為一個 FPGA 上實作的投幣接物小遊戲，主要目標如下：

- Dot Matrix 點陣顯示
- 按鍵消抖（Debouncer）
- 多組除頻器（10kHz / 5Hz / 1Hz）
- 60 秒倒數計時
- 遊戲核心邏輯（玩家移動、金幣生成、計分）

---

## 二、系統模組說明

### 1. Debouncer（`debounce.v`）

為了配合遊戲使用的 **5Hz 慢速時鐘**，本專案特別設計按鍵消抖邏輯：

- 一般 debouncer 常輸出 **極短的 pulse**
- 但遊戲核心 **每 0.2 秒（5Hz）才讀一次輸入**
- 若使用 pulse，容易發生「按了卻沒讀到」的情況

#### 本專案的設計方式
- 採用 **Level Detection**
- 只要按鈕被按住，輸出就維持為 `1`
- 遊戲核心一定能讀到輸入
- 同時可實現 **長按持續移動** 的操作體驗

---

### 2. 遊戲核心（`player_ctrl.v`, `coin_generator.v`, `score_keeper.v`）

遊戲核心由三個子模組組成：

#### (1) Player Control（`player_ctrl.v`）
- 控制玩家位於畫面下方的平台
- 可左右移動
- X 座標範圍：`0 ~ 7`

#### (2) Coin Generator（`coin_generator.v`）
- 隨機產生金幣的 X 座標
- 金幣從畫面頂端開始掉落：
  - 起始位置：`Y = 0`
  - 終點位置：`Y = 15`
- 每 0.2 秒（5Hz）下降一格

#### (3) Score Keeper（`score_keeper.v`）
- 判斷玩家是否成功接到金幣
- 若成功接到：
  - 分數加一（分數規則可再調整）
  - 金幣重置，重新生成

---

### 3. Dot Matrix 顯示（`matrix_driver.v`）

負責點陣矩陣的硬體掃描與顯示：

- 以 **10kHz** 的速度掃描每一行
- 接收來自遊戲核心的座標資訊：
  - 玩家位置 `(X, Y)`
  - 金幣位置 `(X, Y)`
- 將玩家與金幣即時顯示於 Dot Matrix 上

---

### 4. 倒數計時（60 秒）（`game_timer.v`）

- 使用 **1Hz 時鐘**
- 從 60 秒開始倒數
- 當倒數至 0：
  - 輸出 `time_up` 訊號
  - 通知遊戲核心停止遊戲運作

---

### 5. 除頻器（`freq_div.v`，已完成）

由系統主時鐘產生多組時鐘訊號：

| 頻率 | 用途 |
|----|----|
| 10kHz | Dot Matrix 掃描顯示 |
| 5Hz | 遊戲核心（移動 / 掉落速度） |
| 1Hz | 倒數計時 |

其中 **5Hz 遊戲時鐘**使金幣每 0.2 秒下降一格，遊戲難度適中，亦可視需求調整。

---

## 三、專案結構

```text
constraints/
└─ pin_plan.tcl

src/
├─ display/
│  ├─ matrix_driver.v
│  └─ seg_decoder.v
│
├─ util/
│  ├─ debounce.v
│  └─ freq_div.v
│
├─ game/
│  ├─ player_ctrl.v
│  ├─ coin_generator.v
│  ├─ score_keeper.v
│  ├─ game_core.v
│  └─ game_timer.v
│
└─ coin_catcher_game.v   # Top module
