class Brick {
  // variables for how broken the brick is, dimensions, position, and color
  int breakValue;
  int brickHeight = 20;
  int brickWidth = 60;
  int x;
  int y;
  //color brickColor;
  boolean destroyed = false; //is it destroyed?
  PImage brick;

  Brick(int tempBV, int tempX, int tempY, color tempColor) {
    breakValue = tempBV;
    x = tempX;
    y = tempY;
    //brickColor = tempColor;
    brick = loadImage("sprite_0.png");
  }

  void display() {
    rectMode(CORNER);
    image(brick, x, y);
    //rect(x, y, brickWidth, brickHeight);
  }

  void update() {
    // color switch depending on brick value. brick disappears past 6
    switch(breakValue) {
    case 0: 
      brick = loadImage("sprite_0.png");
      break;
    case 1: 
      brick = loadImage("sprite_1.png");
      break;
    case 2: 
      brick = loadImage("sprite_2.png");
      break;
    case 3: 
      brick = loadImage("sprite_3.png");
      break;
    case 4: 
      brick = loadImage("sprite_4.png");
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
        if (game == 1) {
          breakValue++;
        } else {
          breakValue+=3;
        }
        ball.changeVY();
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