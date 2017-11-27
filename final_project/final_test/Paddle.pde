class Paddle {
  // variables for dimensions, position, speed and velocity
  int pWidth;
  int pHeight;
  int vx;
  int vy;
  int x;
  int y;
  int pSpeed;

  Paddle(int tempW, int tempH, int tempVX, int tempX, int tempY, int tempS) {
    pWidth = tempW;
    pHeight = tempH;
    vx = tempVX;
    x = tempX;
    y = tempY;
    pSpeed = tempS;
  }

  void display() {
    fill(255, 0, 255);
    rect(x, y, pWidth, pHeight); // draw paddle
  }

  void update() { // update paddle position
    x += vx;
    x = constrain(x, 0, width-pWidth);
  }

  void keyPressed() { // controls
    if (keyCode == LEFT) {
      vx = -pSpeed;
    }
    if (keyCode == RIGHT) {
      vx = pSpeed;
    }
  }
  void keyReleased() { // make paddle stop if keys are not being pressed
    if (keyCode == LEFT && vx < 0) {
      vx = 0;
    } else if (keyCode == RIGHT && vx > 0) {
      vx = 0;
    }
  }
}