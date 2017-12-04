class CircleBrick {

  rPaddle[] cPaddle = new rPaddle[15];
  Ball circleBall;

  CircleBrick() {
    for (int i = 0; i < 15; i ++) {
      cPaddle[i] = new rPaddle((sin(radians(i))*290), (cos(radians(i))*290), 3);
    }
    circleBall = new Ball(0, 0, 20, 5, 5);
  }

  void drawCircleBricks() {

    //pushing matrix to set the origin at the center of the window to move the paddles around
    pushMatrix();
    translate(width/2, height/2);
    text("CIRCLE BRICKS", 0, 0);
    for (int i = 0; i <15; i++) {
      cPaddle[i].display();
      cPaddle[i].update();
    }

    circleBall.display();

    popMatrix();

    circleBall.update();
  }

  void keyPressed() {
    for (int i = 0; i <15; i++) {
      cPaddle[i].keyPressed();
    }
  }
  void keyReleased() {
    for (int i = 0; i <15; i++) {
      cPaddle[i].keyReleased();
    }
  }
}