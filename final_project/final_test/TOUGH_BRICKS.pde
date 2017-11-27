// TONKA BRICKS (OR JUST REALLY TOUGH BRICKS IDK)

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

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j< 10; j++) {
        bricks[i*10+j] = new Brick(0, j*60, i*20, color(255, 0, 0));
      }
    }
  }
  void drawToughBricks() {
    if (lives<=0) {
      gameOver();
    } else if (destroyedBricks>=bricks.length) {
      win();
    } else {
      game();
    }
  }
  // controls for paddle
  void keyPressed() {
    paddle.keyPressed();
    if (keyCode == ' ') { // explosion
      if (bomb>0) {
        ellipse(ball.x, ball.y, 150, 150); // have an ellipse where the explosion happens
        for (int i = 0; i < bricks.length; i++) { // go through every brick to check how close it is to the explosion, and destroy accordingly
          if (dist(ball.x, ball.y, bricks[i].x, bricks[i].y) < 50) {
            bricks[i].breakValue += 6;
          } else if (dist(ball.x, ball.y, bricks[i].x, bricks[i].y) < 100) {
            bricks[i].breakValue += 4;
          } else if (dist(ball.x, ball.y, bricks[i].x, bricks[i].y) < 150) {
            bricks[i].breakValue += 2;
          }
        }
        bomb--;
      } else {
        text("no more bombs!", width/2, height/2);
      }
    }
  }
  void keyReleased() {
    paddle.keyReleased();
  }
  void game() {
    // display and update everything. Check collisions;
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
    destroyedBricks = 0;
    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(ball);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        println(destroyedBricks);
      }
    }
    if (ball.y >= height) {// if ball is past paddle)
      lives-=1;
    }
  }
  void gameOver() {
    fill(255);
    text("game over", width/2, height/2);
  }
  void win() {
    fill(255);
    text("you win", width/2, height/2);
  }
}