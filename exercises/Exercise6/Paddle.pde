class Paddle {
  float x;
  float y;

  Paddle() {
  }
  void update() {
    fill(255); //making it invisible (or slightly transparent for testing purposes)
    noStroke();
    ellipseMode(CORNER);
    ellipse(brightestPixel.x, brightestPixel.y -50, 100, 100); // CHANGE - since the program picks the 
    // brightest pixel on the left if a light source, and not at the center... I start the shape on the left.
}
  
}