class Brick {
  // variables for how broken the brick is, dimensions, position, and color
  int breakValue; //
  int brickHeight = 20;
  int brickWidth = 60;
  int x;
  int y;
  //color brickColor;
  boolean destroyed = false; //is it destroyed?
  PImage p;
  PImage brick0;
  PImage brick1;
  PImage brick2;
  PImage brick3;
  PImage brick4;

  Brick(int tempBV, int tempX, int tempY, color tempColor) {
    breakValue = tempBV;
    x = tempX;
    y = tempY;
    //brickColor = tempColor;
    brick0 = loadImage("bricks/sprite_0.png");
    brick1 = loadImage("bricks/sprite_1.png");
    brick2 = loadImage("bricks/sprite_2.png");
    brick3 = loadImage("bricks/sprite_3.png");
    brick4 = loadImage("bricks/sprite_4.png");
  }

  void display() {// color switch depending on brick value. brick disappears past 6
    imageMode(CORNER);
    switch(breakValue) {
    case 0: 
      image(brick0, x, y);
      break;
    case 1: 
      image(brick1, x, y);
      break;
    case 2: 
      image(brick2, x, y);
      break;
    case 3: 
      image(brick3, x, y);
      break;
    case 4: 
      image(brick4, x, y);
      break;
    default:
      destroyed = true;
      break;
    }
    
    
  }

  void update() {
    
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
        if (game == 4) {
          ow.play();
        } else {
          bounce.play();
        }
      }
    } else { // once ball is away from brick, reset hit
      if (ball.y > height/2) {
        hitOnce = false;
      }
    }
  }
}