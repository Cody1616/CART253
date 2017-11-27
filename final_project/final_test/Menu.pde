class Menu {
  void display() {
    textAlign(CENTER);
    textSize(50);
    text("BROKEN BRICKS", width/2, height/4);
    textSize(20);
    text("Press 1 to play TOUGH BRICKS \n 2 for Cat Brick \n3 for Beer Pong\n4 for Circle\n5 for head \n6for real", width/2, height/2);
  }
  void keyPressed() {
    if (key == '1') { //TB
      game = 1;
    } else if (key == '2') { //CB
      game = 2;
    } else if (key == '3') { // BP
      game = 3;
    } else if (key == '4') { // CiB
      game = 4;
    } else if (key == '5') { //HB
      game = 5;
    } else if (key == '6') { //RB
      game = 6;
    } else {
      for (int i = 0; i == 1000; i++) {
        text("please press a valid number", width/2, height - 50);
      }
    }
  }
}