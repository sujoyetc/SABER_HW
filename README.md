# Hardware implementation of Saber

The codes are for academic research use only and does not come with any support or any responsibility. 

Paper source https://eprint.iacr.org/2020/434.pdf

In this paper, we present an instruction set coprocessor architecture for lattice-based cryptography and implement the module lattice-based post-quantum key encapsulation (KEM) scheme Saber as a case study. To achieve fast computation time, the architecture is fully implemented in hardware, including CCA transformations. Since polynomial multiplication plays a performance-critical role in the module and ideal lattice-based public-key cryptography, a parallel polynomial multiplier architecture is proposed that overcomes memory access bottlenecks and results in a highly parallel yet simple and easy-to-scale design. Such multipliers can compute a full multiplication in $256$ cycles, but are designed to target any area/performance trade-offs. Besides optimizing polynomial multiplication, we make important design decisions and perform architectural optimizations to reduce the overall cycle counts as well as improve resource utilization. 

For the module dimension 3 (security comparable to AES-192), the coprocessor computes CCA key generation, encapsulation, and decapsulation in only 5,453, 6,618 and 8,034 cycles respectively, making it the fastest hardware implementation of Saber. On a Xilinx UltraScale+ XCZU9EG-2FFVB1156 FPGA, the entire instruction set coprocessor architecture runs at 250 MHz clock frequency and consumes 23,686 LUTs, 9,805 FFs, and 2 BRAM tiles (including 5,113 LUTs and 3,068 FFs for the Keccak core).


