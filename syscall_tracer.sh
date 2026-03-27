#!/bin/bash

echo "================================================"
echo "  KERNEL BEHAVIOR | System Call Tracer"
echo "  $(date)"
echo "================================================"
echo ""

echo "  [1] Most used syscalls on system:"
cat /proc/*/syscall 2>/dev/null | awk '{print $1}' | sort | uniq -c | sort -rn | head -15
echo ""

echo "  [2] Syscall stats for current shell:"
cat /proc/$$/syscall 2>/dev/null
echo ""

echo "  [3] Kernel version and build:"
uname -a
cat /proc/version
echo ""

echo "  [4] Loaded kernel modules:"
lsmod | head -20
echo ""

echo "  [5] Kernel messages (last 20):"
dmesg | tail -20
echo ""

echo "  [6] Kernel parameters:"
sysctl -a 2>/dev/null | grep -E "kernel.hostname|kernel.ostype|kernel.pid_max|vm.swappiness|net.ipv4.ip_forward"
echo ""

echo "================================================"
echo "  Done."
echo "================================================"
