class Paddle {
  int pWidth;
  int pHeight;
  int vx;
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
    fill(255, 255, 0);
    rect(x, y, pWidth, pHeight);
  }

  void update() {
    x += vx;
    x = constrain(x, 0, width-pWidth);
  }
}