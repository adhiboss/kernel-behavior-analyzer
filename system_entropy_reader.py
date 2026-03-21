with open("/proc/sys/kernel/random/entropy_avail") as f:
    entropy = f.read().strip()

print("Kernel Random Entropy Pool:")
print(entropy)
