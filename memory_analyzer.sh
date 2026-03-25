#!/bin/bash

echo "================================================"
echo "  KERNEL BEHAVIOR | Memory Analyzer"
echo "  $(date)"
echo "================================================"
echo ""

echo "  [1] Total Memory Overview:"
free -h
echo ""

echo "  [2] Detailed Memory Info from Kernel:"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Cached|SwapTotal|SwapFree|Dirty|Writeback"
echo ""

echo "  [3] Top 10 Memory Consuming Processes:"
ps -eo pid,pmem,rss,comm --sort=-pmem | head -11
echo ""

echo "  [4] Memory per CPU core:"
vmstat -s | head -20
echo ""

echo "  [5] Page faults:"
sar -B 1 3 2>/dev/null || vmstat 1 3 | awk 'NR>2 {print "  Page-in: "$7 " Page-out: "$8}'
echo ""

echo "================================================"
echo "  Done."
echo "================================================"
