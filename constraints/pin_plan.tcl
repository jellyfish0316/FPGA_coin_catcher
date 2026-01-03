## This file is a pin assignment tcl file for the DE10-Lite board 
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after "to") according to the top level signal names in the project

## Set clock (50Mhz)
set_location_assignment PIN_P11 -to clk;

## Set reset
##set_location_assignment PIN_F15 -to rest;

## Set buttons
set_location_assignment PIN_B8 -to btn_left;
set_location_assignment PIN_A7 -to btn_right;

## Set switches
set_location_assignment PIN_C10 -to reset;
#set_location_assignment PIN_C11 -to enable[1];
#set_location_assignment PIN_D12 -to enable[2];
#set_location_assignment PIN_C12 -to enable[3];
#set_location_assignment PIN_A12 -to enable[4];
#set_location_assignment PIN_B12 -to enable[5];
#set_location_assignment PIN_A13 -to sw[6];
#set_location_assignment PIN_A14 -to sw[7];
#set_location_assignment PIN_B14 -to sw[8];
#set_location_assignment PIN_F15 -to sw[9];

## Set LEDs
#set_location_assignment PIN_A8 -to led[0];
#set_location_assignment PIN_A9 -to led[1];
#set_location_assignment PIN_A10 -to led[2];
#set_location_assignment PIN_B10 -to led[3];
#set_location_assignment PIN_D13 -to led[4];
#set_location_assignment PIN_C13 -to led[5];
#set_location_assignment PIN_E14 -to led[6];
#set_location_assignment PIN_D14 -to led[7];
#set_location_assignment PIN_A11 -to led[8];
#set_location_assignment PIN_B11 -to led[9];

## Set Keypad row
#set_location_assignment PIN_AB2 -to keypad_row[0];
#set_location_assignment PIN_AB3 -to keypad_row[1];
#set_location_assignment PIN_AA5 -to keypad_row[2];
#set_location_assignment PIN_AA6 -to keypad_row[3];

## Set Keypad col
#set_location_assignment PIN_Y5 -to keypad_col[0];
#set_location_assignment PIN_Y4 -to keypad_col[1];
#set_location_assignment PIN_Y3 -to keypad_col[2];
#set_location_assignment PIN_AA2 -to keypad_col[3];

## Set dot matrix row
set_location_assignment PIN_AA8 -to dot_row[0];
set_location_assignment PIN_AA10 -to dot_row[1];
set_location_assignment PIN_W10 -to dot_row[2];
set_location_assignment PIN_Y8 -to dot_row[3];
set_location_assignment PIN_V7 -to dot_row[4];
set_location_assignment PIN_W9 -to dot_row[5];
set_location_assignment PIN_V8 -to dot_row[6];
set_location_assignment PIN_W7 -to dot_row[7];

## Set dot matrix col_0
set_location_assignment PIN_AB13 -to dot_col[0];
set_location_assignment PIN_AA14 -to dot_col[1];
set_location_assignment PIN_W5 -to dot_col[2];
set_location_assignment PIN_Y11 -to dot_col[3];
set_location_assignment PIN_W6 -to dot_col[4];
set_location_assignment PIN_AB12 -to dot_col[5];
set_location_assignment PIN_W12 -to dot_col[6];
set_location_assignment PIN_W13 -to dot_col[7];

## Set dot matrix col_1
set_location_assignment PIN_AB10 -to dot_col[8];
set_location_assignment PIN_AA15 -to dot_col[9];
set_location_assignment PIN_V5 -to dot_col[10];
set_location_assignment PIN_Y7 -to dot_col[11];
set_location_assignment PIN_W8 -to dot_col[12];
set_location_assignment PIN_AA9 -to dot_col[13];
set_location_assignment PIN_AB11 -to dot_col[14];
set_location_assignment PIN_W11 -to dot_col[15];

## Set seven segment display_0
set_location_assignment PIN_C14 -to HEX_0[0];
set_location_assignment PIN_E15 -to HEX_0[1];
set_location_assignment PIN_C15 -to HEX_0[2];
set_location_assignment PIN_C16 -to HEX_0[3];
set_location_assignment PIN_E16 -to HEX_0[4];
set_location_assignment PIN_D17 -to HEX_0[5];
set_location_assignment PIN_C17 -to HEX_0[6];
# set_location_assignment PIN_D15 -to DP[0];

## Set seven segment display_1
set_location_assignment PIN_C18 -to HEX_1[0];
set_location_assignment PIN_D18 -to HEX_1[1];
set_location_assignment PIN_E18 -to HEX_1[2];
set_location_assignment PIN_B16 -to HEX_1[3];
set_location_assignment PIN_A17 -to HEX_1[4];
set_location_assignment PIN_A18 -to HEX_1[5];
set_location_assignment PIN_B17 -to HEX_1[6];
#set_location_assignment PIN_A16 -to DP[1];

## Set seven segment display_2
set_location_assignment PIN_B20 -to HEX_2[0];
set_location_assignment PIN_A20 -to HEX_2[1];
set_location_assignment PIN_B19 -to HEX_2[2];
set_location_assignment PIN_A21 -to HEX_2[3];
set_location_assignment PIN_B21 -to HEX_2[4];
set_location_assignment PIN_C22 -to HEX_2[5];
set_location_assignment PIN_B22 -to HEX_2[6];
#set_location_assignment PIN_A19 -to DP[2];

## Set seven segment display_3
set_location_assignment PIN_F21 -to HEX_3[0];
set_location_assignment PIN_E22 -to HEX_3[1];
set_location_assignment PIN_E21 -to HEX_3[2];
set_location_assignment PIN_C19 -to HEX_3[3];
set_location_assignment PIN_C20 -to HEX_3[4];
set_location_assignment PIN_D19 -to HEX_3[5];
set_location_assignment PIN_E17 -to HEX_3[6];
# set_location_assignment PIN_D22 -to DP[3];

## Set seven segment display_4
set_location_assignment PIN_F18 -to HEX_4[0];
set_location_assignment PIN_E20 -to HEX_4[1];
set_location_assignment PIN_E19 -to HEX_4[2];
set_location_assignment PIN_J18 -to HEX_4[3];
set_location_assignment PIN_H19 -to HEX_4[4];
set_location_assignment PIN_F19 -to HEX_4[5];
set_location_assignment PIN_F20 -to HEX_4[6];
# set_location_assignment PIN_F17 -to DP[4];

## Set seven segment display_5
set_location_assignment PIN_J20 -to HEX_5[0];
set_location_assignment PIN_K20 -to HEX_5[1];
set_location_assignment PIN_L18 -to HEX_5[2];
set_location_assignment PIN_N18 -to HEX_5[3];
set_location_assignment PIN_M20 -to HEX_5[4];
set_location_assignment PIN_N19 -to HEX_5[5];
set_location_assignment PIN_N20 -to HEX_5[6];
# set_location_assignment PIN_L19 -to DP[5];

## Set VGA
#set_location_assignment PIN_N3 -to vga_hs;
#set_location_assignment PIN_N1 -to vga_vs;
#set_location_assignment PIN_AA1 -to vga_r[0];
#set_location_assignment PIN_V1 -to vga_r[1];
#set_location_assignment PIN_Y2 -to vga_r[2];
#set_location_assignment PIN_Y1 -to vga_r[3];
#set_location_assignment PIN_W1 -to vga_g[0];
#set_location_assignment PIN_T2 -to vga_g[1];
#set_location_assignment PIN_R2 -to vga_g[2];
#set_location_assignment PIN_R1 -to vga_g[3];
#set_location_assignment PIN_P1 -to vga_b[0];
#set_location_assignment PIN_T1 -to vga_b[1];
#set_location_assignment PIN_P4 -to vga_b[2];
#set_location_assignment PIN_N2 -to vga_b[3];