#!/bin/bash

echo "================================================"
echo "  KERNEL BEHAVIOR | Disk I/O Monitor"
echo "  $(date)"
echo "================================================"
echo ""

echo "  [1] Disk Usage:"
df -h | grep -v tmpfs
echo ""

echo "  [2] Disk I/O Stats from Kernel:"
cat /proc/diskstats | awk '{print "  "$3, "reads:"$4, "writes:"$8}'
echo ""

echo "  [3] Top I/O Consuming Processes:"
ionice -c 3 iostat -x 1 3 2>/dev/null || echo "  Install sysstat: sudo apt install sysstat"
echo ""

echo "  [4] Mount Points:"
mount | grep -E "ext4|xfs|btrfs|ntfs"
echo ""

echo "  [5] Inode Usage:"
df -i | grep -v tmpfs
echo ""

echo "  [6] Largest files in home:"
du -ah ~ 2>/dev/null | sort -rh | head -10
echo ""

echo "================================================"
echo "  Done."
echo "================================================"
