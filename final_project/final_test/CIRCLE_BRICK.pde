class CircleBrick {

  rPaddle[] cPaddle = new rPaddle[10];
  Ball circleBall;

  CircleBrick() {
    for (int i = 0; i < 10; i ++) {
      cPaddle[i] = new rPaddle((sin(i)*290), (cos(i)*290), 5);
    }
  }

  void drawCircleBricks() {

    //pushing matrix to set the origin at the center of the window to move the paddles around
    pushMatrix();
    translate(width/2, height/2);
    text("CIRCLE BRICKS", 0, 0);
    for (int i = 0; i <10; i++) {
      cPaddle[i].display();
      cPaddle[i].update();
    }

    popMatrix();
  }

  void keyPressed() {
    for (int i = 0; i <10; i++) {
      cPaddle[i].keyPressed();
    }
  }
  void keyReleased() {
    for (int i = 0; i <10; i++) {
      cPaddle[i].keyReleased();
    }
  }
}