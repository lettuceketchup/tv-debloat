# Draws the Projectivy input cards (640x360, diagonal gradient, icon left) into this folder.
# Palette taken from the Wallpaper Engine "Relaxing Walls" wallpapers. Run: python -I make_cards.py
import os
from PIL import Image, ImageDraw, ImageFont

W, H, R = 640, 360, 40
F = lambda f, s: ImageFont.truetype('C:/Windows/Fonts/' + f, s)
hx = lambda h: tuple(int(h[i:i + 2], 16) for i in (1, 3, 5))
mix = lambda a, b, k: tuple(int(x * k + y * (1 - k)) for x, y in zip(a, b))
WHITE = (250, 250, 252)

# file, name, subtitle, Segoe Fluent Icons glyph, gradient stops (deep, mid, light)
CARDS = [
    ('hdmi4-jio', 'Jio', 'HDMI 4', '\uE7F4', ['#16306a', '#3f6fc0', '#7fc0ee']),
    ('hdmi2-camera', 'Camera', 'HDMI 2', '\uE722', ['#0f4a52', '#2f9a92', '#62d0c0']),
    ('hdmi1-ps5-pc', 'PS5 / PC', 'HDMI 1', '\uE7FC', ['#2b2a6e', '#6f6fc0', '#e8899a']),
    ('hdmi3', 'HDMI 3', 'Not connected', '\uE703', ['#2a3550', '#6d7b98', '#c9d3e6']),
]

def card(name, sub, glyph, stops):
    s = [hx(c) for c in stops]
    im = Image.new('RGB', (W, H))
    px = im.load()
    for y in range(H):
        for x in range(W):
            t = min(1, max(0, (x / W * 0.6 + y / H * 0.7) / 1.3)) ** 1.3
            px[x, y] = mix(s[1], s[0], t / 0.55) if t < 0.55 else mix(s[2], s[1], (t - 0.55) / 0.45)
    d = ImageDraw.Draw(im)
    d.text((118, H // 2), glyph, font=F('SegoeIcons.ttf', 108), fill=WHITE, anchor='mm')
    d.text((236, H // 2 - 30), name, font=F('seguisb.ttf', 72), fill=WHITE, anchor='lm')
    d.text((239, H // 2 + 44), sub, font=F('seguisb.ttf', 42), fill=WHITE, anchor='lm')
    mask = Image.new('L', (W, H), 0)
    ImageDraw.Draw(mask).rounded_rectangle([0, 0, W - 1, H - 1], R, fill=255)
    out = Image.new('RGBA', (W, H), (0, 0, 0, 0))
    out.paste(im, (0, 0), mask)
    return out

here = os.path.dirname(os.path.abspath(__file__))
for f, *args in CARDS:
    card(*args).save(os.path.join(here, f + '.png'))
    print(f + '.png')
