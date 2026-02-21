I designed and implemented a complete AES-128 encryption architecture in hardware using SystemVerilog. The implementation includes:
128-bit plaintext and key input handling
4×4 state matrix representation
Complete 10-round AES encryption flow
Individual modules for SubBytes, ShiftRows, MixColumns, and AddRoundKey
Fully implemented Key Expansion module for round key generation
Verified functionality using known AES test vectors (e.g., 69c4e0d86a7b0430d8cdb78070b4c55a)
Simulation and debugging of intermediate round outputs
The design follows a modular and structured architecture, making it scalable and easy to debug or extend for AES-192/256 in the future.
