class redPaddle {
  float pixelX;
  float pixelY;
  redPaddle() {
  }


  void display() {
    fill(255, 0, 0, 10); //making it invisible (or slightly transparent for testing purposes)
    rectMode(CORNER);
    rect(pixelX, pixelY, 200, 100);
  }
}