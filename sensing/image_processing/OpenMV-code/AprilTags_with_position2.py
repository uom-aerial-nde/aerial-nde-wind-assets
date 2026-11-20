# Untitled - By: Lidia - Thu Nov 19 2026


import csi
import time
import math

csi0 = csi.CSI()
csi0.reset()
csi0.pixformat(csi.RGB565)
csi0.framesize(csi.QQVGA) # 160 x 120
csi0.snapshot(time=2000)

clock = time.clock()

tag_size = 0.1 # 10cm

while True:
    clock.tick()
    img = csi0.snapshot()
    clock.tick()
    img = csi0.snapshot()
    for tag in img.find_apriltags():

        # identiy and label apriltag
        img.draw_rectangle(tag.rect, color=(255, 0, 0))
        img.draw_cross((tag.cx, tag.cy), color=(0, 255, 0))
        print_args = (180 * tag.rotation / math.pi)
        print("Family:", tag.name, "ID:", tag.id, "rotation", print_args)

        # calculate relative position
        x_distance = tag.x_translation * tag_size
        y_distance = tag.y_translation * tag_size
        z_distance = tag.z_translation * tag_size
        total_distance = math.sqrt((x_distance**2) + (y_distance**2) + (z_distance**2))

        print("Tag Relative Coordinates (m):", x_distance, y_distance, z_distance)
        print("Total Distance from camera:", total_distance)

        if x_distance < -0.05:
            img.draw_string((0, 50), "Left")
            x_correct = False
        elif x_distance > 0.05:
            img.draw_string((120, 50), "Right")
            x_correct = False
        else:
            x_correct = True

        if y_distance < -0.05:
            img.draw_string((70, 110), "Down")
            y_correct = False
        elif y_distance > 0.05:
            img.draw_string((70, 0), "Up")
            y_correct = False
        else:
            y_correct = True

        if z_distance < -0.30:
            img.draw_string((50, 50), "Forward")
            z_correct = False
        else:
            z_correct = True

        if x_correct == True and y_correct == True and z_correct == True:
            img.draw_string((40, 50), "IN POSITION", (255, 0, 0))
        else:
            d = str(round(total_distance,5)) + 'm'
            img.draw_string((0, 90), "Target \nDistance:", (255, 0, 0))
            img.draw_string((0, 110), d, (255, 0, 0))

    print("clock:", clock.fps())
