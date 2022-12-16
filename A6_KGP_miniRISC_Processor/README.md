# KGP mini RISC Processor

In the 6th Assignment of the course Computer Organisation Lab (CS39001), our task was to implement a single-cycle instruction execution unit.

We were given the ISA and were asked to design the OP-code, the datapath and the actual hardware modules (ALU, Control Unit, Instruction Decoder, Program Counter and so on) to implement the ISA.

The hardware was purely combinational in design and the clock cycle length was determined by the single longest instruction in the ISA. The _instruction memory_ was accessed during the _positive half_ of the clock cycle and _data memory_ (pertains to all load/store type operations) was accessed during the _negative half_ of the clock cycle.

## Design of the Datapath
![Datapath](/A6_KGP_miniRISC_Processor/Report/datapath.jpg)

## Given ISA
| **Class**                               | **Instruction**                 | **Usage**      | **Meaning**                                           |
|-----------------------------------------|---------------------------------|----------------|-------------------------------------------------------|
| Arithmetic                              | Add                             | add rs,rt      | $rs  \leftarrow (rs)+(rt)$                            |
|                                         | Comp                            | comp rs,rt     | $rs \leftarrow$ 2's Complement $(rt)$                 |
| Logic                                   | AND                             | and rs,rt      | $rs \leftarrow (rs) \wedge (rt)$                      |
|                                         | XOR                             | xor rs,rt      | $rs \leftarrow (rs) \oplus  (rt)$                     |
| Shift                                   | Shift left logical              | shll rs, sh    | $rs \leftarrow (rs)$ left-shifted by $sh$             |
|                                         | Shift right logical             | shrl rs, sh    | $rs \leftarrow (rs)$ right-shifted by $sh$            |
|                                         | Shift left logical variable     | shllv rs, rt   | $rs \leftarrow (rs)$ left-shifted by $(rt)$           |
|                                         | Shift right logical variable    | shrlv rs, rt   | $rs \leftarrow (rs)$ right-shifted by $(rt)$          |
|                                         | Shift right arithmetic          | shra rs, sh    | $rs \leftarrow (rs)$ arithmetic right-shifted by sh   |
|                                         | Shift right arithmetic variable | shrav rs, rt   | $rs \leftarrow (rs)$ arithmetic right-shifted by (rt) |
| Complex                                 | Diff                            | diff rs, rt    | $rs \leftarrow$ the LSB bit at which rs and rt differ |
| Arithmetic Immediate                    | Add immediate                   | addi rs,imm    | $rs \leftarrow (rs) + imm$                            |
|                                         | Complement Immediate            | compi rs,imm   | $rs \leftarrow$ 2's Complement $(imm)$                |
| Memory                                  | Load Word                       | lw rt, imm(rs) | $rt \leftarrow mem[(rs)+imm]$                         |
|                                         | Store Word                      | sw rt, imm(rs) | $mem[(rs)+imm] \leftarrow (rt)$                       |
| Branch                                  | Branch Register                 | br rs          | goto (rs)                                             |
|                                         | Branch on less than 0           | bltz rs, L     | if $(rs) < 0$ then goto L                             |
|                                         | Branch on flag zero             | bz rs, L       | if $(rs) = 0$ then goto L                             |
|                                         | Branch on flag not zero         | bnz rs, L      | if $(rs) \neq 0$ then goto L                          |
|                                         | Unconditional branch            | b L            | goto L                                                |
|                                         | Branch and link                 | bl L           | goto L; $ra \leftarrow (PC) + 4$                      |
|                                         | Branch on Carry                 | bcy L          | goto L if Carry = 1                                   |
|                                         | Branch on No Carry              | bncy L         | goto L if Carry = 0                                   |


## YouTube Link of the Processor running on a Nexys 4 FPGA Board
https://youtu.be/KJNqiYCnoeI
