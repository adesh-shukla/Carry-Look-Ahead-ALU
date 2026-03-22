# 8-bit Carry Look-Ahead ALU (Verilog)

This project is an implementation of an 8-bit ALU using a Carry Look-Ahead (CLA) Adder in Verilog.  
The main goal was to understand how faster addition works compared to ripple carry and how different operations can be combined into a single ALU design.

---

## What this project does

This ALU can perform both arithmetic and logical operations on 8-bit inputs.

Operations supported:
- Addition  
- Subtraction (using 2’s complement)  
- Bitwise AND  
- Bitwise OR  
- Bitwise XOR  

The arithmetic part is implemented using a CLA adder, so carry is calculated faster instead of waiting for propagation like in ripple carry.

---

## How it works (basic idea)

- The ALU takes two 8-bit inputs: a and b  
- Control signals:  
  - sel → selects operation  
  - sub → decides addition or subtraction  
- For subtraction, b is converted into 2’s complement internally  
- Logical operations are handled separately  

---

## Selection 

 sel  sub  Operation 
--------------------
 11   0    Addition 
 11   1    Subtraction 
 01   0    OR 
 00   0    AND 
 10   0    XOR 

---

## Project Files

Carry-Look-Ahead-ALU/
│
├── 8bit_CLA_ALU_design.sv  
├── 8bit_CLA_ALU_testbench.sv  
├── 8bit_CLA_ALU_waveform.png  
└── README.md  

---

## Simulation

I verified the design using a testbench.

Steps:
1. Compile design + testbench  
2. Run simulation  
3. View waveform (GTKWave / EPWave)  

---

## Output Waveform

The waveform shows:
- Correct sum for addition  
- Proper subtraction using 2’s complement  
- Logical operations working as expected  

---

## What I learned

- How Carry Look-Ahead logic works (Generate & Propagate)  
- Difference between CLA and ripple carry  
- Writing modular Verilog code  
- Basics of writing a testbench and verifying outputs  

---

## Future improvements

- Add flags (Zero, Carry, Overflow, Sign)  
- Make it parameterized (so it works for N-bit)  
- Try integrating it into a simple CPU  
- Write a self-checking testbench  

---

## Author

Adesh Shukla  
Interested in Digital Design and learning Verilog/SystemVerilog  
