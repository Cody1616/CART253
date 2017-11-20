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

  void keyPressed() {
    if (keyCode == LEFT) {
      vx = -pSpeed;
    }
    if (keyCode == RIGHT) {
      vx = pSpeed;
    }
  }
  void keyReleased(){
    if (keyCode == LEFT && vx < 0) {
    vx = 0;
  } else if (keyCode == RIGHT && vx > 0) {
    vx = 0;
  }
  
  
  }
}