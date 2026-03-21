import os
import time

def read_interrupts():
    with open("/proc/interrupts") as f:
        return f.readlines()

def read_load():
    with open("/proc/loadavg") as f:
        return f.read()

while True:
    os.system("clear")
    print("==== Kernel Event Watcher ====\n")

    print("System Load:")
    print(read_load())

    print("\nTop Interrupt Activity:")
    interrupts = read_interrupts()[1:10]
    for line in interrupts:
        print(line.strip())

    time.sleep(3)
