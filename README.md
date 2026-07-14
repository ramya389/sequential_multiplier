# Pipelined Sequential Multiplier using Verilog HDL

## Project Overview

This project implements an **8-bit Pipelined Sequential Multiplier** using **Verilog HDL** based on the **Shift-and-Add multiplication algorithm**. The design incorporates a **two-stage pipeline** to improve throughput while maintaining sequential multiplication functionality. The project includes RTL design, functional verification, FPGA synthesis, implementation, timing analysis, and bitstream generation using **Xilinx Vivado**.

The objective is to study the impact of pipelining on sequential arithmetic circuits and analyze the design in terms of functionality, timing, and FPGA resource utilization.

---

## Objectives

* Design an 8-bit sequential multiplier using Verilog HDL.
* Implement a two-stage pipelined architecture.
* Verify functionality using a comprehensive Verilog testbench.
* Perform synthesis, placement, routing, and implementation in Xilinx Vivado.
* Apply timing constraints and analyze timing reports.
* Generate FPGA bitstream for hardware implementation.
* Evaluate resource utilization and critical path performance.

---

## Features

* 8-bit × 8-bit multiplication
* Shift-and-Add multiplication algorithm
* Two-stage pipelined architecture
* Start/Done handshake control
* Synchronous operation with asynchronous reset
* Functional verification using multiple test cases
* FPGA synthesis and implementation
* Timing constraint support
* Bitstream generation for FPGA deployment

---

## Architecture

The multiplier consists of the following functional blocks:

* Input Registers
* Multiplicand Register
* Multiplier Register
* Product Register
* Counter Logic
* Pipeline Registers
* Shift-and-Add Logic
* Control Unit
* Done Signal Generator

The pipelined architecture separates multiplication operations into different stages, allowing improved throughput and easier timing closure compared to a conventional sequential implementation.

---

## Project Files

### RTL Design

* `sequential_multiplier.v`

### Testbench

* `tb_sequential_multiplier.v`

### Vivado TCL Scripts

* Synthesis Script
* Implementation Script
* Bitstream Generation Script

### Constraints

* Clock Constraint File (15 ns Clock)
* Bitstream Configuration
* DRC Suppression Settings

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* TCL Scripting
* FPGA Synthesis and Implementation Tools

---

## Verification

The design was verified using a self-checking Verilog testbench with multiple test cases.

### Test Cases

|                Input A | Input B |            Expected Output |
| ---------------------: | ------: | -------------------------: |
|                      5 |       7 |                         35 |
|                    255 |       1 |                        255 |
|                    128 |       2 |                        256 |
| Reset During Operation |       — | Proper Reset Functionality |

The testbench validates:

* Functional correctness
* Reset operation
* Start/Done control
* Pipeline execution
* Output verification

---

## Implementation Flow

1. RTL Design
2. Functional Simulation
3. Synthesis
4. Optimization
5. Placement
6. Routing
7. Timing Analysis
8. Bitstream Generation

---

## Timing Constraints

A 15 ns clock period was applied during implementation.

```tcl
create_clock -period 15.000 -name clk -waveform {0.000 7.500} [get_ports clk]
```

The design was synthesized and routed successfully using Vivado implementation tools.

---

## Key Concepts Demonstrated

* Sequential Digital Design
* Shift-and-Add Multiplication
* Pipeline Architecture
* RTL Design
* FPGA Implementation
* Timing Constraints
* Timing Analysis
* Resource Optimization
* Verilog Testbench Development
* ASIC/FPGA Design Flow

---

## Applications

* Arithmetic Logic Units (ALUs)
* Digital Signal Processing (DSP)
* Embedded Processors
* FPGA-Based Computing Systems
* VLSI Datapath Design
* Hardware Accelerators

---

## Future Improvements

* Increase pipeline depth for higher operating frequencies.
* Support signed multiplication.
* Implement Booth Multiplier architecture.
* Add configurable operand widths.
* Optimize area and power consumption.
* Compare sequential, pipelined, and parallel multiplier architectures.

---

## Learning Outcomes

This project provided practical experience in:

* Verilog HDL design
* Pipelined datapath development
* Functional verification
* Xilinx Vivado implementation flow
* FPGA synthesis and routing
* Timing analysis
* Hardware optimization techniques

---

## Author

**M. Ramya Sree**

B.Tech – Electronics and Communication Engineering (VLSI Design)

Vellore Institute of Technology (VIT), Chennai

---

⭐ If you found this project useful, feel free to star this repository.
