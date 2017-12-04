class CircleBrick {

  rPaddle[] cPaddle = new rPaddle[15];
  Ball circleBall;
  Brick[] bricks = new Brick[12];

  int destroyedBricks = 0;
  int lives = 5; // int for lives

  CircleBrick() {

    for (int i = 0; i < 15; i ++) {
      cPaddle[i] = new rPaddle((sin(radians(i))*290), (cos(radians(i))*290), 3);
    }
    circleBall = new Ball(0, 0, 20, 5, 5);
    int h = -100;
    for (int i = 0; i < 4; i++) {
      int w = -100;
      for (int j = 0; j< 3; j++) {
        bricks[i*3+j] = new Brick(0, w, h, color(255, 0, 0));
        w += 60;
      }
      h -= 20;
    }
  }

  void drawCircleBricks() {
    if (destroyedBricks >= bricks.length) {
      win();
    }
    if (lives <=0) {
      gameOver();
    } else {
      game();
    }
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

  void game() {
    //pushing matrix to set the origin at the center of the window to move the paddles around
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i <15; i++) {
      cPaddle[i].display();
      cPaddle[i].update();
      circleBall.collide(cPaddle[i]);
    }
    fill(255);
    text("Lives left: "+ lives, -230, -280);
    circleBall.display();
    circleBall.update();

    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(circleBall);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        // count destroyed bricks
      }
    }
    if (circleBall.x>=width/2||circleBall.y>=height/2||circleBall.x <=-width/2||circleBall.y<=-height/2) {
      lives--;
    }
    popMatrix();
  }

  void gameOver() {   // if the player lost
    fill(255);
    text("game over", width/2, height/2);
  }
  void win() { // if the player won
    fill(255);
    text("you win", width/2, height/2);
  }
}