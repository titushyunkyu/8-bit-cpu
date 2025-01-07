# 8-bit Central Processing Unit (CPU) Design in VHDL

This repository contains the VHDL implementation of an 8-bit CPU designed with a hierarchical architecture. The project demonstrates the principles of digital logic design, modularity, and hardware description languages, implemented and simulated using Quartus. Below is an overview of the project structure and components.

---

## **Project Description**
The 8-bit CPU is designed to execute basic operations such as load, store, add, subtract, and conditional branching. The architecture was developed using a modular, hierarchical design to ensure clarity, scalability, and maintainability.

---

## **Hierarchical Structure**

### **1. Top-Level Component: `simple_cpu`**
The `simple_cpu` is the primary component that integrates the following subcomponents:
- **`opcode_decoder`**: Decodes the instruction opcode.
- **`instruction_sequencer`**: Handles instruction sequencing, built using `d_ff` components (D flip-flops).
- **`control_signals_logic`**: Generates control signals for other components.
- **`datapath`**: Handles data operations and interconnections between the ALU, registers, and memory.

---

### **2. Subcomponents**

#### **2.1. `opcode_decoder`**
- A standalone entity responsible for decoding opcodes.
- No other subcomponents.

#### **2.2. `instruction_sequencer`**
- Contains `d_ff` components, which implement D flip-flops for sequential logic.

#### **2.3. `control_signals_logic`**
- A standalone entity responsible for generating control signals.
- No other subcomponents.

#### **2.4. `datapath`**
The `datapath` is the core for data handling and processing. It integrates the following subcomponents:
- **`alu`**: Performs arithmetic and logical operations.
  - **`adder_subtractor`**: A subcomponent of the ALU, used for addition and subtraction.
    - **`full_adder`**: A core component of the `adder_subtractor`, implementing binary addition.
- **`parser`**: Handles data parsing and intermediate computations.
- **`tri_state_model`**: Manages tri-state bus operations.
- **`dreg_e`**: Implements data registers with enable functionality.
- **`z_ff`**: Tracks the zero flag.
  - **`d_ff`**: Subcomponent of `z_ff`, implements the D flip-flop functionality.

---

## **Files Overview**
| File Name                  | Description                                      |
|----------------------------|--------------------------------------------------|
| `simple_cpu.vhd`           | Top-level CPU module.                           |
| `opcode_decoder.vhd`       | Decodes opcodes into control signals.           |
| `instruction_sequencer.vhd`| Handles sequential logic for instructions.      |
| `control_signals_logic.vhd`| Generates control signals for subcomponents.    |
| `datapath.vhd`             | Core for data handling and processing.          |
| `alu.vhd`                  | Arithmetic Logic Unit for operations.           |
| `adder_subtractor.vhd`     | Performs addition and subtraction.              |
| `fulladder.vhd`            | Core logic for binary addition.                 |
| `parser.vhd`               | Handles intermediate data parsing.              |
| `tri_state_model.vhd`      | Implements tri-state bus operations.            |
| `dreg_e.vhd`               | Data register with enable functionality.        |
| `z_ff.vhd`                 | Implements the zero flag.                       |
| `d_ff.vhd`                 | Basic D flip-flop component.                    |

---

## **How to Use**
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/8-bit-cpu
2. Open the project in Quartus or any VHDL-compatible IDE.
3. Simulate the components and top-level module using testbenches for functional verification.
4. Verify hierarchical connectivity and timing by running simulations for the `simple_cpu` and subcomponents.

---

## **Features**
- **Hierarchical Design**: Modular structure for ease of debugging and scalability.
- **8-bit Architecture**: Supports basic operations (load, store, add, subtract, branch).
- **VHDL Implementation**: Developed entirely in VHDL, ensuring portability and compatibility.

---

## **Future Improvements**
- Expand the instruction set to support more complex operations and additional addressing modes.
- Implement pipelining to improve performance by overlapping instruction execution.
- Add support for interrupts, input/output operations, and external peripherals to enhance CPU functionality.

---

Feel free to reach out for questions or suggestions regarding the project!
