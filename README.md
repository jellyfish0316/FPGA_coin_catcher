# Coin Catcher Verolog FPGA Game

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
