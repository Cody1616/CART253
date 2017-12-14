class Menu {
  void display() {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("BROKEN BRICKS", width/2, height/4);
    textSize(20);
    text("PRESS:\n 1 to play TOUGH BRICKS \n2 for CAT BOUNCE \n3 for ORBIT BRICKS\n4 for HEADBREAKER \n5 for REAL BRICKS", width/2, height/2);
  }
  void keyPressed() {
    // switch for different codes
    switch(keyCode) {

    case '1':
      game = 1;
      break;

    case '2':
      game = 2;
      break;

    case '3':
      game = 3;
      break;

    case '4':
      game = 4;
      break;

    case '5':
      game = 5;
      break;

    default:
      fill(255);
      text("please enter valid number", width/2, height-15);
      break;
    }
  }
}