#!/bin/bash

# -----------------------------------------------
# kernel-behavior-analyzer | interrupt_monitor.sh
# Monitor hardware interrupts in real time
# -----------------------------------------------

RESET="\033[0m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"

while true; do
    clear
    echo ""
    echo -e "${CYAN}================================================${RESET}"
    echo -e "  KERNEL | Interrupt Monitor | $(date '+%H:%M:%S')"
    echo -e "${CYAN}================================================${RESET}\n"

    echo -e "  ${YELLOW}[1] Hardware Interrupts (/proc/interrupts):${RESET}"
    cat /proc/interrupts | head -20 | while read line; do
        echo "  $line"
    done
    echo ""

    echo -e "  ${YELLOW}[2] Softirqs (/proc/softirqs):${RESET}"
    cat /proc/softirqs | while read line; do
        echo "  $line"
    done
    echo ""

    echo -e "  ${YELLOW}[3] IRQ Stats:${RESET}"
    grep -E "intr|ctxt" /proc/stat | while read line; do
        echo "  $line"
    done
    echo ""

    echo -e "${CYAN}  Refreshing every 3s — Ctrl+C to exit${RESET}"
    sleep 3
done
