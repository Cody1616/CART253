class CircleBrick {

  rPaddle[] cPaddle = new rPaddle[15];
  Ball circleBall;
  Brick[] bricks = new Brick[12];

  int destroyedBricks;
  int lives = 5; // int for lives

  boolean rules = false;


  CircleBrick() {

    for (int i = 0; i < 15; i ++) { //place circles side by side along an ellipse
      cPaddle[i] = new rPaddle((sin(radians(i))*290), (cos(radians(i))*290), 3);
    }
    circleBall = new Ball(0, 0, 20, 5, 5);

    //int for brick position on y axis
    int h = -100;
    //create new bricks
    for (int i = 0; i < 4; i++) {
      // int for brick x position
      int w = -100;
      for (int j = 0; j< 3; j++) {
        bricks[i*3+j] = new Brick(0, w, h, color(255, 0, 0));
        w += 60; // increase w to create a brick next to the brick just made
      }
      h -= 20; // decrease to place a row below the one just created
    }
  }

  void drawCircleBricks() {

    if (!rules) {
      instructions();
    } else if (rules) {
      if (destroyedBricks >= bricks.length) {
        win();
      }
      // if you lose all your lives, you lose
      if (lives <=0) {
        gameOver();
      } 
      // else, keep playing
      else {
        game();
      }
    }
  }

  void keyPressed() {
    if (!rules) {
      if (key == 'x') {
        rules = true;
      }
    }
    for (int i = 0; i <15; i++) { // go through all the paddle components and move them
      cPaddle[i].keyPressed();
    }
  }
  void keyReleased() {
    for (int i = 0; i <15; i++) {// go through all the paddle components and stop them
      cPaddle[i].keyReleased();
    }
  }

  void game() {
    //pushing matrix to set the origin at the center of the window to move the paddles around
    pushMatrix();
    translate(width/2, height/2);

    // go through paddle components, display, update, check collisions
    for (int i = 0; i <15; i++) {
      cPaddle[i].display();
      cPaddle[i].update();
      circleBall.collide(cPaddle[i]);
    }

    // display lives
    fill(255);
    text("Lives left: "+ lives, -230, -280);

    // display and update ball
    circleBall.display();
    circleBall.update();


    destroyedBricks = 0; // amount of destroyed bricks
    for (int i = 0; i < bricks.length; i++) { //go through bricks to display, update, check collisions
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(circleBall);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        // count destroyed bricks
      }
    }
    // if ball is out of bounds, lose a life
    if (circleBall.x>=width/2||circleBall.y>=height/2||circleBall.x <=-width/2||circleBall.y<=-height/2) {
      lives--;
    }
    popMatrix();
  }


  // ******************** game states ***********************

  void instructions() {
    fill(255);
    text("Use ARROW KEYS to move the paddle AROUND the bricks!\nBreak all the bricks, and make sure\nthe ball doesn't go out of bounds!\nPress X to continue", width/2, height/2);
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