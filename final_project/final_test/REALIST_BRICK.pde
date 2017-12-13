class RealBrick {

  Ball ball;
  Capture video;
  Brick[] bricks = new Brick[30];
  redPaddle paddle;
  int lives = 5; // int for lives
  int destroyedBricks = 0;

  RealBrick(PApplet applet) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j< 10; j++) {
        bricks[i*10+j] = new Brick(0, j*60, i*20, color(255, 0, 0));
      }
    }
    video = new Capture(applet, 640, 480, 30); // "this" isnt working
    paddle = new redPaddle();
    ball = new Ball(width/2, height/2, 20, 5, 5, applet);
  }
  void startCapture() {
    video.start();
  }

  void drawRealBrick() {
    text("REAL BRICKS", width/2, height/2);
    pushMatrix();
    imageMode(CENTER);
    translate(width/2, height/2);
    scale(-1, 1);
    // place video image
    image(video, 0, 0);
    handleVideoInput();


    popMatrix();

    ball.display();
    ball.update();
    ball.collide(paddle);
    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(ball);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        // count destroyed bricks
      }
    }
    findRed();
    paddle.display();
  }
  void handleVideoInput() {
    // Check if there's a frame to look at
    if (!video.available()) {
      // If not, then just return, nothing to do
      return;
    }

    // If we're here, there IS a frame to look at so read it in
    video.read();
  }

  void findRed() {
    // Start with a very low "record" for the brightest pixel
    // so that we'll definitely find something better

    float highestColorValue = 1000;

    // Go through every pixel in groups of 10
    // frame of video
    for (int x = 0; x < video.width; x+=40) {
      for (int y = 0; y < video.height; y+=40) {

        // Get the redness of the block
        int r = 0;
        int g = 0;
        int b = 0;
        for (int xp = 0; xp <40; xp++) {
          for (int yp = 0; yp <40; yp++) {
            // Calculate the location in the 1D pixels array (in the square)
            int loc = (x+xp) + (y+yp) * width;
            // Get the color of the pixel we're looking at
            color currentColor = video.pixels[loc];
            r+= red(currentColor);
            g+= green(currentColor);
            b+= blue(currentColor);
          }
        }
        color pixelColor = color(r/1600, g/1600, b/1600); // average (100 per block)
        float pixelColorValue = dist(255, 0, 0, red(pixelColor), green(pixelColor), blue(pixelColor));
        // Check if this pixel is the brighest we've seen so far
        if (pixelColorValue < highestColorValue) {
          highestColorValue = pixelColorValue;
          paddle.pixelX = x;
          paddle.pixelY = y;
        }
      }
    }
  }
}