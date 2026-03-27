#!/bin/bash

echo "================================================"
echo "  KERNEL BEHAVIOR | Network Traffic Monitor"
echo "  $(date)"
echo "================================================"
echo ""

echo "  [1] Network Interfaces:"
ip -h link show
echo ""

echo "  [2] Live Network Stats from Kernel:"
cat /proc/net/dev | awk 'NR>2 {print "  "$1, "RX:"$2, "TX:"$10}'
echo ""

echo "  [3] Active Connections:"
ss -tunap | head -20
echo ""

echo "  [4] Routing Table:"
ip route show
echo ""

echo "  [5] DNS Resolution:"
cat /etc/resolv.conf
echo ""

echo "  [6] Open Ports:"
ss -tlnp
echo ""

echo "  [7] Network Errors:"
cat /proc/net/dev | awk 'NR>2 {print "  "$1, "RX-errors:"$4, "TX-errors:"$12}'
echo ""

echo "================================================"
echo "  Done."
echo "================================================"
