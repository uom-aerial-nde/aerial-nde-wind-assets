# Untitled - By: Lidia - Wed Nov 18 2026

import csi
import time
import math


csi0 = csi.CSI()
csi0.reset()
csi0.pixformat(csi.RGB565)
csi0.framesize(csi.QQVGA)  # 160 x 120 largest resolution that can be used with AprilTags on this camera
csi0.snapshot(time=2000)

clock = time.clock()

while True:
    clock.tick()
    img = csi0.snapshot()
    for tag in img.find_apriltags():
        img.draw_rectangle(tag.rect, color=(255, 0, 0))
        img.draw_cross((tag.cx, tag.cy), color=(0, 255, 0))
        print_args = (180 * tag.rotation / math.pi)
        print("Family:", tag.name, "ID:", tag.id, "rotation", print_args)
    print(clock.fps())
