#!/bin/bash
echo "Executing sudo sysctl -w kernel.randomize_va_space=0 (Disable address randomization)"
sudo sysctl -w kernel.randomize_va_space=0
echo "Executing sudo ln -sf /bin/zsh /bin/sh (Link bin/sh to bin/zsh)"
sudo ln -sf /bin/zsh /bin/sh
echo "Compile and run our shellcode"
gcc -z execstack -o call_shellcode call_shellcode.c
echo "Run our shellcode"
sudo chown root call_shellcode
sudo chmod 4755 call_shellcode
./call_shellcode
