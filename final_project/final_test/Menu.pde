class Menu {
  void display() {
    textAlign(CENTER);
    textSize(50);
    text("BROKEN BRICKS", width/2, height/4);
    textSize(20);
    text("Press 1 to play TOUGH BRICKS \n2 for Cat Brick \n3 for Beer Pong\n4 for Circle\n5 for head \n6for real", width/2, height/2);
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

    case '6':
      game = 6;
      break;

    default:
      text("please enter valid number", width/2, height-15);
      break;
    }
  }
}