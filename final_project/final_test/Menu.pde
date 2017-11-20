class Menu {
  void display() {
    textAlign(CENTER);
    textSize(50);
    text("BROKEN BRICKS", width/2, height/2);
    textSize(20);
    text("Press 1 to play TOUGH BRICKS (more coming soon!!!)", width/2, height/4*3);
  }
  void keyPressed() {
    if (key == '1') {
      game = 1;
    }
  }
}