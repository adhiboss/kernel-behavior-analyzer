#!/bin/bash

# -----------------------------------------------
# kernel-behavior-analyzer | kernel_modules.sh
# Analyze loaded kernel modules and dependencies
# -----------------------------------------------

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"

echo ""
echo -e "${CYAN}================================================${RESET}"
echo -e "  KERNEL | Module Analyzer | $(date '+%H:%M:%S')"
echo -e "${CYAN}================================================${RESET}\n"

echo -e "  ${YELLOW}[1] Total Loaded Modules:${RESET}"
total=$(lsmod | wc -l)
echo -e "  ${GREEN}$total modules loaded${RESET}\n"

echo -e "  ${YELLOW}[2] Top 15 Modules by Memory:${RESET}"
lsmod | awk 'NR>1 {print $1, $2}' | sort -k2 -rn | head -15 | \
    awk '{printf "  %-30s %s KB\n", $1, int($2/1024)}'
echo ""

echo -e "  ${YELLOW}[3] Network Modules:${RESET}"
lsmod | grep -iE "net|eth|wifi|wlan|tcp|ip" | while read line; do
    echo "  $line"
done
echo ""

echo -e "  ${YELLOW}[4] Filesystem Modules:${RESET}"
lsmod | grep -iE "ext4|xfs|btrfs|fat|ntfs|fuse" | while read line; do
    echo "  $line"
done
echo ""

echo -e "  ${YELLOW}[5] Security Modules:${RESET}"
lsmod | grep -iE "selinux|apparmor|seccomp|crypto" | while read line; do
    echo "  $line"
done
echo ""

echo -e "  ${YELLOW}[6] Kernel Version:${RESET}"
uname -r
echo ""

echo -e "  ${YELLOW}[7] Kernel Build Info:${RESET}"
cat /proc/version
echo ""

echo -e "${CYAN}================================================${RESET}\n"
