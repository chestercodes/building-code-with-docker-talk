import time

top = 5
print("Counting to " + str(top))

for i in range(1, top + 1):
    print(i)
    time.sleep(1)

print("Done.")