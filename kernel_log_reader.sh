#!/bin/bash

echo "==== Kernel Log Reader ===="
echo ""

dmesg | tail -n 20
