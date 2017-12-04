class rPaddle {
  int size = 20; // size
  float x; // x position
  float y; // y position
  int deg; //movement/speed in degrees
  int spin = 0; // velocity
  PVector point; // vector to store location

  rPaddle(float tempX, float tempY, int tempDeg) {
    x = tempX;
    y = tempY;
    deg = tempDeg;
    point = new PVector(0, 0); // initialize point
  }

  void display() {
    fill(255);
    noStroke();
    ellipseMode(CENTER); 
    ellipse(x, y, size, size);
  }

  void update() {
    // since rotate resets after each draw loop/pop matrix...
    // store x and y into the point vector
    point.x = x; 
    point.y = y;
    // rotate vector
    point.rotate(radians(spin));
    // replace paddle position with new rotated position
    x = point.x;
    y = point.y;
  }

  void keyPressed() { // controls - use left and right to spin
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