class Brick {
  // variables for how broken the brick is, dimensions, position, and color
  int breakValue;
  int brickHeight = 20;
  int brickWidth = 60;
  int x;
  int y;
  color brickColor;
  boolean destroyed = false;


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
    // color switch depending on brick value. brick disappears at 6
    switch(breakValue) {
    case 0: 
      brickColor = color(255, 0, 0);
      break;
    case 1: 
      brickColor = color(250, 0, 0);
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
    default:
      destroyed = true;
      break;
    }
  }

  void collide (Ball ball) {
    // check if ball is colliding
    boolean inLeft = (ball.x + ball.size >= x);
    boolean inRight = (ball.x <= x + brickWidth);
    boolean inTop = (ball.y + ball.size >= y);
    boolean inBelow = (ball.y <= y + brickHeight);
    boolean hitOnce = false; // bool to make sure the breaking only happens once per hit
    if (inLeft && inRight && inTop && inBelow) {
      if (hitOnce == false) { // if the brick hasn't been "hit" yet
        breakValue++;

        ball.vy = -ball.vy;
        ball.y = y+ball.size+brickHeight;
        hitOnce = true; // set hit to true so it doesn't happen again
      }
    } else { // once ball is away from brick, reset hit
      if (ball.y > height/2) {
        hitOnce = false;
      }
    }
  }
}