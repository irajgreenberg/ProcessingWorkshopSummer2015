void removegreen(PImage input) {
  for (int i = 0; i < input.pixels.length; i++) {
    float r = red(input.pixels[i]);
    float g = green(input.pixels[i]);
    float b = blue(input.pixels[i]);

    if (g > 175 && r < 210 && b < 150 || 145 < g && g < 180 && 100 < r && r < 130 || 105 < g && g < 160 && 60 < r && r < 100 && 40 < b && b < 80) {
      input.pixels[i] = color(0, 0, 0, 0);
    } else {
      input.pixels[i] = color(r, g - 25, b);
    }
  }
}

