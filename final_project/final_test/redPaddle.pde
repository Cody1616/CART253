class redPaddle {
  float pixelX;
  float pixelY;
  int pWidth = 200;
  int pHeight = 50;
  redPaddle() {
  }


  void display() {
    fill(255, 0, 0, 10); //making it invisible (or slightly transparent for testing purposes)
    rectMode(CORNER);
    rect(pixelX, pixelY, pWidth, pHeight);
  }
}