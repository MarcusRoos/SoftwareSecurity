#!/bin/bash
echo "Executing sudo sysctl -w kernel.randomize_va_space=2 (Enables address randomization)"
sudo /sbin/sysctl -w kernel.randomize_va_space=2
echo "Executing sudo ln -sf /bin/dash /bin/sh (Link bin/sh to bin/dash)"
sudo ln -sf /bin/dash /bin/sh
echo "Compile stack.c with a BUF_SIZE of 90"
gcc -DBUF_SIZE=90 -o stack -z execstack -fno-stack-protector stack.c
echo "Sets ownership of program to root & enable Set-UID"
sudo chown root stack
sudo chmod 4755 stack
echo "Compile exploit2.c"
gcc -o exploit2 exploit2.c
echo "Run exploit2 & then run the Bruteforce script"
./exploit2
Brute.sh