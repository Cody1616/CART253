class Paddle {
  // float for color value
  float targetR;
  float targetB; // distance between color values
  // PVector highestPixel; // location of the bluest pixel
  color circleColor; // color of the circle around the reddest/bluest pixel

  Paddle(float r, float b, color CC) {
    targetR = r;
    targetB = b;
    circleColor = CC;
  }
  float pixelX;
  float pixelY;
  void display() {
    fill(circleColor, 50); //making it invisible (or slightly transparent for testing purposes)
    noStroke();
    ellipseMode(CORNER);
    ellipse(pixelX -50, pixelY -50, 100, 100);
  }
  void update() {// Start with a very low "record" for the brightest pixel
    // so that we'll definitely find something better
    float highestColorValue = 1000;

    // Go through every pixel in the grid of pixels made by this
    // frame of video
    for (int x = 0; x < video.width; x++) {
      for (int y = 0; y < video.height; y++) {
        // Calculate the location in the 1D pixels array
        int loc = x + y * width;
        // Get the color of the pixel we're looking at
        color pixelColor = video.pixels[loc];
        // Get the brightness of the pixel we're looking at
        // CHANGE - instead, we look at the REDDEST pixel
        float pixelColorValue = dist(targetR, 0, targetB, red(pixelColor), green(pixelColor), blue(pixelColor));
        // Check if this pixel is the brighest we've seen so far
        if (pixelColorValue < highestColorValue) {
          highestColorValue = pixelColorValue;
          pixelX = x;
          pixelY = y;
        }
      }
    }
  }
}