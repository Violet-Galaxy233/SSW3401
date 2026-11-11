"""Generate the original local airplane image used for this lab, without dependencies."""
from pathlib import Path
import math
import struct
import zlib

SIZE, SCALE = 120, 4
outline = [(21, 16), (21, 14), (13, 9), (13, 3.5), (12, 2), (11, 3.5),
           (11, 9), (3, 14), (3, 16), (11, 13.5), (11, 19), (9, 20.5),
           (9, 22), (12, 21), (15, 22), (15, 20.5), (13, 19), (13, 13.5)]
angle = math.pi / 4
points = [(60 + 3.0 * ((x-12)*math.cos(angle) - (y-12)*math.sin(angle)),
           60 + 3.0 * ((x-12)*math.sin(angle) + (y-12)*math.cos(angle))) for x, y in outline]

def inside(x, y):
    hit = False
    for i, (ax, ay) in enumerate(points):
        bx, by = points[i-1]
        if (ay > y) != (by > y) and x < (bx-ax)*(y-ay)/(by-ay)+ax:
            hit = not hit
    return hit

pixels = bytearray()
for row in range(SIZE):
    pixels.append(0)
    for col in range(SIZE):
        total = [0, 0, 0]
        for sy in range(SCALE):
            for sx in range(SCALE):
                x, y = col+(sx+.5)/SCALE, row+(sy+.5)/SCALE
                color = (239, 249, 250)
                if (x-60)**2 + (y-60)**2 <= 46**2:
                    color = (34, 151, 178)
                if inside(x, y):
                    color = (255, 255, 255)
                total = [a+b for a, b in zip(total, color)]
        pixels.extend(round(value/(SCALE*SCALE)) for value in total)

def chunk(kind, data):
    return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind+data) & 0xffffffff)

output = Path(__file__).resolve().parents[1] / 'assets/images/logo.png'
output.parent.mkdir(parents=True, exist_ok=True)
output.write_bytes(b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>IIBBBBB', SIZE, SIZE, 8, 2, 0, 0, 0))
                   + chunk(b'IDAT', zlib.compress(pixels, 9)) + chunk(b'IEND', b''))
print('Generated', output)
