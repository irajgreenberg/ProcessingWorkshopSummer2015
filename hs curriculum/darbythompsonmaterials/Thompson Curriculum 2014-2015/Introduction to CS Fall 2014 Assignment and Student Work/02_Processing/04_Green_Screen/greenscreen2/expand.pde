PImage expand(PImage input) {
  PImage out = createImage(input.width * 2, input.height * 2, RGB);
  for (int x = 0; x < out.width; x++) {
    for (int y = 0; y < out.height; y++) {
      int loc = (x / 2) + (y / 2) * input.width;
      if (x + 1 + y * out.width >= out.width * out.height) {
        break;
      }
      out.pixels[x + y * out.width] = input.pixels[loc];
      out.pixels[x + 1 + y * out.width] = input.pixels[loc];
      out.pixels[x + y + 1 * out.width] = input.pixels[loc];
      out.pixels[x + 1 + y + 1 * out.width] = input.pixels[loc];
    }
  }
  return out;
}

