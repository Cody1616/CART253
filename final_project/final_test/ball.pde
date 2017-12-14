class Ball {
  // variables for position, size, velocity
  int x;
  int y;
  int size;
  int vx;
  int vy;
  PImage face;

  Ball(int tempX, int tempY, int tempSize, int tempVX, int tempVY) {
    x = tempX;
    y = tempY;
    size = tempSize;
    vx = tempVX;
    vy = tempVY;
    
  }


  void display() {
    if(game == 4){
      image(face, x, y);
    }
    // draw ball
    else{
    fill(255);
    ellipse(x, y, size, size);
    }
  }

  void update() {
    // update position and check if bouncing against walls
    x += vx;
    y += vy;
    checkBounce();
  }

  void checkBounce() {
    if (game == 3) {
      if (x>width/2||y>height/2||x <-width/2||y<-height/2) {
        x = 0;
        y = 0;
      }
    } else {

      // if ball is hitting a wall, reverse it
      if (x < 0 || x + size > width) {
        changeVX();
        playSound();
      }

      if (y < 0) {
        changeVY();
        playSound();
      }
      if (y + size > height) {// if ball is past paddle, reset
        x = width/2;
        y = height/2;
      }
      // make sure the ball stays in window (for now)
      x = constrain(x, 0, width-size);
    }
  }
  void collide(Paddle paddle) { 
    // collision with paddle
    if (/*left*/x+size >= paddle.x-paddle.pWidth/2 && /*right*/x<= paddle.x +paddle.pWidth/2 && /*up*/ y+size >= paddle.y-paddle.pHeight/2 && /*down*/y<= paddle.y + paddle.pHeight/2) {
      //reverse
      changeVY();
      //place on top of paddle
      y = paddle.y - paddle.pWidth/2 - size;
      //play sound
      playSound();
    }
  }
  void collide(rPaddle cPaddle) {
    if (dist(x, y, cPaddle.x, cPaddle.y) < 20) {
      changeVX();
      changeVY();
      playSound();
    }
  }

  void collide(redPaddle other) {
    // collision with paddle
    if (x >= other.pixelX-other.pWidth/2 && x<= other.pixelX +other.pWidth/2 && y >= other.pixelY-other.pHeight/2 && y<= other.pixelY + other.pHeight/2) {
      //if paddle is going down, reverse
      if (vy >0) { 
        changeVY();
      }
      //place on top of paddle
      y = floor(other.pixelY);
      playSound();
    }
  }

  void changeVX() {
    vx = -vx;
    if (vx<0) {
      vx = int(random(-7, -4));
    } else if (vx>0) {
      vx = int(random(4, 7));
    }
  }

  void changeVY() {
    vy = -vy;
    if (vy<0) {
      vy = int(random(-7, -4));
    } else if (vy>0) {
      vy = int(random(4, 7));
    }
  }
  void playSound() {
    if (game == 4) {
      ow.play();
    } else {
      bounce.play();
    }
  }
}