PImage shrink(PImage input) {
  PImage out = createImage(input.width / 2, input.height / 2, RGB);
  for (int x = 0; x < out.width; x++) {
    for (int y = 0; y < out.height; y++) {
      if (x + y * out.width == out.width * out.height) {
        break;
      }
      out.pixels[x + y * out.width] = input.pixels[x * 2 + y * 4 * out.width];
    }
  }
  return out;
}

