# White region detection - OpenMV port of the MATLAB version
import csi
import time

csi0 = csi.CSI()
csi0.reset()
csi0.pixformat(csi.RGB565)  # colour
csi0.framesize(csi.QVGA)     # framesize 320x240
csi0.snapshot(time=2000)

clock = time.clock()

# Threshold for whitenesss
# LAB colour space: L = brightness (0-100), A and B = colour (0 = no colour)
white = [(70, 100, -30, 30, -30, 30)]   # (L_min, L_max, A_min, A_max, B_min, B_max)

# Filter
min_pixels = 200  # like bwareaopen / Area > 2000 (smaller here: QVGA image)
min_fill = 0.85  # like Solidity > 0.85

min_elongation = 4


# How completely the blob fills its rotated bounding rectangle (0-1)
def rect_fill(b):
    c = b.min_corners
    area = 0
    for i in range(4):
        x0, y0 = c[i]
        x1, y1 = c[(i + 1) % 4]
        area += x0 * y1 - x1 * y0
    area = abs(area) / 2
    return b.pixels / area if area > 0 else 0


while True:
    clock.tick()
    t0 = time.ticks_ms()

    img = csi0.snapshot()

# Find and measure white regions
# merge=True + margin joins nearby blobs (like imclose bridging small gaps)
    blobs = img.find_blobs(white,
                           pixels_threshold=min_pixels,
                           area_threshold=min_pixels,
                           merge=True,
                           margin=5)

# shape filter
    blobs = [b for b in blobs if rect_fill(b) > min_fill]

    if not blobs:
        print("No blade found!")
        continue

    for j in range(len(blobs)):


        # largest region
        maxregion = max(blobs, key=lambda b: b.pixels)

        region = blobs[j]

        corners = region.corners
        cx, cy = region.cx, region.cy

        elapsed = time.ticks_diff(time.ticks_ms(), t0)

        if maxregion == blobs[j]:
            colourline = (255, 0, 0)
        else:
            colourline = (0, 255, 0)

    # outline on image
        for i in range(4):
            x0, y0 = corners[i]
            x1, y1 = corners[(i + 1) % 4]
            img.draw_line((x0, y0, x1, y1), color=colourline, thickness=2)

    # centroid
        img.draw_cross((cx, cy), color=(255, 0, 0), size=10, thickness=2)

        for (x, y) in corners:
            img.draw_circle((x, y, 4), color=(255, 255, 0), thickness=2)

        print("Centroid:", (region.cx, region.cy),
              "Corners:", corners,
              "Time: %d ms" % elapsed,
              "FPS: %.1f" % clock.fps())
