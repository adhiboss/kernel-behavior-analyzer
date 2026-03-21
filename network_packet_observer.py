import psutil
import time
import os

while True:
    os.system("clear")
    print("==== Network Packet Observer ====\n")

    net = psutil.net_io_counters()

    print(f"Bytes Sent     : {net.bytes_sent}")
    print(f"Bytes Received : {net.bytes_recv}")
    print(f"Packets Sent   : {net.packets_sent}")
    print(f"Packets Recv   : {net.packets_recv}")

    time.sleep(2)
