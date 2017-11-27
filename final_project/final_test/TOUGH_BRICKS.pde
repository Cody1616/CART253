// TONKA BRICKS (OR JUST REALLY TOUGH BRICKS IDK)

class ToughBricks {

  // declare a paddle, a ball and 2 rows of bricks
  Paddle paddle;
  Brick[] bricks = new Brick[30];
  Ball ball;

  ToughBricks() { 
    // initialize paddle, ball, bricks
    paddle = new Paddle(90, 15, 10, width/2, height - 30, 10);
    ball = new Ball(paddle.x, paddle.y, 20, 5, 5);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j< 10; j++) {
        bricks[i*10+j] = new Brick(0, j*60, i*20, color(255, 0, 0));
      }
    }
  }
  void drawToughBricks() {
    // display and update everything. Check collisions
    paddle.display();
    paddle.update();
    ball.display();
    ball.update();
    ball.collide(paddle);
    // go through both bricks arrays
    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(ball);
      }
    }
  }
  // controls for paddle
  void keyPressed() {
    paddle.keyPressed();
    if (keyCode == ' ') { // explosion
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
    }
  }
  void keyReleased() {
    paddle.keyReleased();
  }
}