#!/bin/bash

echo "================================================"
echo "  KERNEL BEHAVIOR | Process Scheduler Observer"
echo "  $(date)"
echo "================================================"
echo ""

echo "  [1] CPU Scheduling Policy of current shell:"
chrt -p $$
echo ""

echo "  [2] Running processes and their priorities:"
ps -eo pid,ni,pri,pcpu,pmem,comm --sort=-pcpu | head -15
echo ""

echo "  [3] Context switches (per second):"
vmstat 1 5 | awk 'NR>2 {print "  cs: "$12 " | interrupts: "$11}'
echo ""

echo "  [4] Kernel scheduler stats:"
cat /proc/schedstat | head -10
echo ""

echo "  [5] CPU runqueue info:"
cat /proc/sched_debug 2>/dev/null | head -20 || echo "  Run as root for full sched_debug"
echo ""

echo "================================================"
echo "  Done. Real kernel data. No simulation."
echo "================================================"
