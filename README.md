# Register File RTL Design (8×16)

## Overview
This project implements an 8-register, 16-bit wide Register File using Verilog HDL.
It supports:
- Two asynchronous read ports
- One synchronous write port

## Architecture
- Register bank: 8 × 16-bit registers
- Write: synchronous (posedge clk)
- Read: combinational
- Register 0 is hardwired to zero

## Interface Signals
| Signal         | Description              |
|----------------|--------------------------|
| clk            | Clock                    |
| rst            | Synchronous reset        |
| we             | Write enable             |
| waddr          | Write address            |
| wdata          | Write data               |
| raddr1, raddr2 | Read addresses           |
| rdata1, rdata2 | Read data outputs        |

## Design Highlights
- Write address decoding using one-hot decoder
- Separate combinational read logic
- Sequential logic for register storage

## Verification
- Self-written testbench
- Verified write and read operations using GTKWave
- VCD waveform attached

## Tools Used
- Quartus Prime Lite Edition (for synthesis)
- Icarus Verilog
- GTKWave ( for Stimulation )

## How to Run Simulation
```bash
iverilog -o reg_file tb/tb_reg_file.v rtl/reg_file.v
vvp reg_file
gtkwave sim/reg_file.vcd
