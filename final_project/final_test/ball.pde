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
    if (game == 1) {

      // if ball is hitting a wall, reverse it
      if (x - size/2 < 0 || x + size/2 > width) {
        vx = -vx;
      }

      if (y - size/2 < 0) {
        vy = -vy;
      }
      if (y > height) {// if ball is past paddle, reset
        x = width/2;
        y = height/2;
      }
      // make sure the ball stays in window (for now)
      x = constrain(x, size/2, width-size/2);
    } 
    else if (game == 4) {
      if (x>width||y>height||x<0||y>0) {
        x = 50;
        y = 50;
      }
    }
  }
  void collide(Paddle paddle) { 
    // collision with paddle
    if (x >= paddle.x && x<= paddle.x +paddle.pWidth && y >= paddle.y && y<= paddle.y + paddle.pWidth) {
      //reverse
      vy = -vy;
      //place on top of paddle
      y = paddle.y - size;
    }
  }
  void collide(rPaddle cPaddle) {
    if (x < cPaddle.x-size && x > cPaddle.x+cPaddle.size&&y < cPaddle.y-size && y > cPaddle.y+cPaddle.size) {
      vx = -vx;
      vy = -vy;
    }
  }
}