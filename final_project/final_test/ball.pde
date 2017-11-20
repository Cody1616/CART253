class Ball {
  int x;
  int y;
  int size;
  int vx;
  int vy;

  Ball(int tempX, int tempY, int tempSize, int tempVX, int tempVY) {
    x = tempX;
    y = tempY;
    size = tempSize;
    vx = tempVX;
    vy = tempVY;
  }
  void display() {
    ellipse(x, y, size, size);
  }

  void update() {
    x += vx;
    y += vy;
    checkBounce();
  }

  void checkBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
    }
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  void collide(Paddle other) {
  }
  void collide(Brick other) {
  }
}