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
    rect(x, y, brickWidth, brickHeight);
  }

  void update() {

    switch(breakValue) {
    case 1: 
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

  void collide (Ball other) {
    if (x> other.x && x< other.x && y > other.x && y< other.x) {
      breakValue++;
    }
  }
}