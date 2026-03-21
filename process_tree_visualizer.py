import psutil

print("==== Process Tree ====\n")

for proc in psutil.process_iter(['pid','name','ppid']):
    try:
        print(f"PID:{proc.info['pid']}  PPID:{proc.info['ppid']}  NAME:{proc.info['name']}")
    except:
        pass
