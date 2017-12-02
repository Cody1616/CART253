class CircleBrick {

  rPaddle[] cPaddle = new rPaddle[10];
  Ball circleBall;

  CircleBrick() {
    for (int i = 0; i < 10; i ++) {
      cPaddle[i] = new rPaddle((sin(radians(i))*290), (cos(radians(i))*290), 3);
      println(i);
      println(sin(radians(i)));
      println(cPaddle[i].x);
      println(cPaddle[i].y);
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