class Ball {
  // variables for position, size, velocity
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
    // draw ball
    fill(255);
    ellipse(x, y, size, size);
  }

  void update() {
    // update position and check if bouncing against walls
    x += vx;
    y += vy;
    checkBounce();
  }

  void checkBounce() {
    // if ball is hitting a wall, reverse it
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    if (y - size/2 < 0) {
      vy = -vy;
    }
    if (y + size/2 > height) {// iff ball is past paddle)
      x = width/2;
      y = height/2;
    }
    // make sure the ball stays in window (for now)
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
  void collide(Paddle paddle) { 
    // collision with paddle
    if (x > paddle.x && x< paddle.x +paddle.pWidth && y > paddle.y && y< paddle.y + paddle.pWidth) {
      // If it was moving to the left
      if (vx < 0) { // if left
        //x = paddle.x;
      } else if (vx > 0) { // if rigt
        //x = paddle.x + paddle.pWidth;
      }
      y = height - paddle.pHeight;
      vx = -vx;
      vy = -vy;
    }
  }
  void collide(Brick brick) {
    // check if colliding with brick
    boolean inLeft = (x + size > brick.x);
    boolean inRight = (x < brick.x + brick.brickWidth);
    boolean inTop = (y + size > brick.y);
    boolean inBelow = (y < brick.y + brick.brickHeight);
    if (inLeft && inRight && inTop && inBelow) {
      vy = -vy;
    }
  }
}