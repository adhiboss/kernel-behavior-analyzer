import psutil
import time
import json

log = []

print("Kernel Behavior Analyzer Started")

try:
    while True:
        snapshot = {
            "time": time.time(),
            "cpu": psutil.cpu_percent(percpu=True),
            "memory": psutil.virtual_memory().percent,
            "disk": psutil.disk_usage("/").percent,
            "process_count": len(psutil.pids())
        }

        log.append(snapshot)

        with open("kernel_behavior_log.json","w") as f:
            json.dump(log,f,indent=2)

        print("snapshot recorded")
        time.sleep(3)

except KeyboardInterrupt:
    print("stopped analyzer")
