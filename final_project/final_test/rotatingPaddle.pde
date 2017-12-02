class rPaddle {
  int size = 20; // size
  float x; // x position
  float y; // y position
  int deg; //movement/speed in degrees
  int spin = 0; // velocity
  PVector point;

  rPaddle(float tempX, float tempY, int tempDeg) {
    x = tempX;
    y = tempY;
    deg = tempDeg;
    point = new PVector(0, 0);
  }

  void display() {
    fill(255);
    ellipseMode(CENTER); 
    ellipse(x, y, size, size);
  }

  void update() {
    point.x = x;
    point.y = y;
    point.rotate(radians(spin));
    println(spin);
    x = point.x;
    y = point.y;
  }

  void keyPressed() { // controls
    if (keyCode == LEFT) {
      spin = -deg;
    }
    if (keyCode == RIGHT) {
      spin = deg;
    }
  }
  void keyReleased() { // make paddle stop if keys are not being pressed
    if (keyCode == LEFT && spin < 0) {
      spin = 0;
    } else if (keyCode == RIGHT && spin > 0) {
      spin = 0;
    }
  }
}