class Brick {

  int breakValue;
  int brickHeight = 20;
  int brickWidth = 60;
  int x;
  int y;
  color brickColor;


  Brick(int tempBV, int tempX, int tempY, color tempColor) {
    breakValue = tempBV;
    x = tempX;
    y = tempY;
    brickColor = tempColor;
  }

  void display() {
    fill(brickColor);
    rect(x, y, brickWidth, brickHeight);
  }

  void update() {

    switch(breakValue) {
    case 1: 
    case 0: 
      brickColor = color(255, 0, 0);
      break;
    case 2: 
      brickColor = color(200, 0, 0);
      break;
    case 3: 
      brickColor = color(150, 0, 0);
      break;
    case 4: 
      brickColor = color(100, 0, 0);
      break;
    case 5: 
      brickColor = color(50, 0, 0);
      break;
    case 6: 
      return;
    }
  }

  void collide (Ball ball) {
    boolean inLeft = (ball.x + ball.size > x);
    boolean inRight = (ball.x < x + brickWidth);
    boolean inTop = (ball.y + ball.size > y);
    boolean inBelow = (ball.y < y + brickHeight);
    boolean hitOnce = false;
    if (inLeft && inRight && inTop && inBelow) {
      if (hitOnce == false) {
        breakValue++;
        println("AAAAAAAAAAAAH" + breakValue);
        hitOnce = true;
      }
    }
    else { // once ball is away from brick, reset hit
    hitOnce = false;
    }
  }
}