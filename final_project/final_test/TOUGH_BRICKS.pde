// TOUGH BRICKS

class ToughBricks {

  // declare a paddle, a ball and 2 rows of bricks
  Paddle paddle;
  Brick[] bricks = new Brick[30];
  Ball ball;
  int bomb = 3; // int for bombs
  int lives = 5; // int for lives
  int destroyedBricks = 0;

  ToughBricks() { 
    // initialize paddle, ball, bricks
    paddle = new Paddle(90, 15, 0, width/2, height - 30, 10);
    ball = new Ball(paddle.x, paddle.y-50, 20, 5, 5);

   // go through bricks
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j< 10; j++) {
        bricks[i*10+j] = new Brick(0, j*60, i*20, color(255, 0, 0));
      }
    }
  }
  void drawToughBricks() {
    // end game if no lives left
    if (lives<=0) {
      gameOver(); 
    } 
    // or if all bricks are destroyed
    else if (destroyedBricks>=bricks.length) {
      win();
    } 
    // else, game on!
    else {
      game();
    }
  }
  // controls for paddle
  void keyPressed() {
    paddle.keyPressed();
    if (keyCode == ' ') { // explosion
      if (bomb>0) {  // if player still has bombs left
        ellipse(ball.x + ball.size, ball.y + ball.size, 150, 150); // have an ellipse where the explosion happens
        for (int i = 0; i < bricks.length; i++) { // go through every brick to check how close it is to the explosion, and destroy accordingly
          if (dist(ball.x + ball.size, ball.y + ball.size, bricks[i].x+bricks[i].brickWidth, bricks[i].y+bricks[i].brickHeight) < 50) {
            bricks[i].breakValue += 6;
          } else if (dist(ball.x + ball.size, ball.y + ball.size, bricks[i].x+bricks[i].brickWidth, bricks[i].y+bricks[i].brickHeight) < 100) {
            bricks[i].breakValue += 4;
          } else if (dist(ball.x + ball.size, ball.y + ball.size, bricks[i].x+bricks[i].brickWidth, bricks[i].y+bricks[i].brickHeight) < 150) {
            bricks[i].breakValue += 2;
          }
        }
        bomb--; //take away one bomb
      } 
      
      else { // if no bombs are left, let the player know
        text("no more bombs!", width/2, height/2);
      }
    }
  }
  void keyReleased() {
    paddle.keyReleased();
  }
  void game() {
    // display and update everything. Check collisions
    fill(255);
    text("Lives left: "+ lives, 60, height-15);
    for (int i = 0; i < bomb; i++) { // draw ellipses for bombs
      ellipse(width-(15+(i*40)), height - 15, ball.size, ball.size);
    }
    paddle.display();
    paddle.update();
    ball.display();
    ball.update();
    ball.collide(paddle);
    // go through both bricks arrays
    destroyedBricks = 0; // amount of destroyed bricks
    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(ball);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        // count destroyed bricks
      }
    }
    if (ball.y >= height) {// if ball goes past boundaries, lose a life
      lives-=1;
    }
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