// TONKA BRICKS (OR JUST REALLY TOUGH BRICKS IDK)

class ToughBricks {

  // declare a paddle, a ball and 2 rows of bricks
  Paddle paddle;
  Brick[] brick1 = new Brick[10];
  Brick[] brick2 = new Brick[10];
  Ball ball;

  ToughBricks() { 
    // initialize paddle, ball, bricks
    paddle = new Paddle(90, 15, 10, width/2, height - 30, 10);
    ball = new Ball(paddle.x, paddle.y, 20, 5, 5);

    for (int i = 0; i < brick1.length; i++) {
      brick1[i] = new Brick(0, i*60, 0, color(255, 0, 0));
    }
    for (int i = 0; i < brick2.length; i++) {
      brick2[i] = new Brick(0, i*60, 20, color(255, 0, 0));
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
    for (int i = 0; i < brick1.length; i++) {
      if (!brick1[i].destroyed) {
        brick1[i].display();
        brick1[i].update();
        brick1[i].collide(ball);
      }
    }
    for (int i = 0; i < brick2.length; i++) {
      if (!brick2[i].destroyed) {
        brick2[i].display();
        brick2[i].update();
        brick2[i].collide(ball);
      }
    }
  }
  // controls for paddle
  void keyPressed() {
    paddle.keyPressed();
    if (keyCode == ' ') {
      ellipse(ball.x, ball.y, 150, 150);
      for (int i = 0; i < brick1.length; i++) {
        if (dist(ball.x, ball.y, brick1[i].x, brick1[i].y) < 50) {
          brick1[i].breakValue += 6;
        } else if (dist(ball.x, ball.y, brick1[i].x, brick1[i].y) < 100) {
          brick1[i].breakValue += 4;
        } else if (dist(ball.x, ball.y, brick1[i].x, brick1[i].y) < 150) {
          brick1[i].breakValue += 2;
        }
      }
      for (int i = 0; i < brick2.length; i++) {
        if (dist(ball.x, ball.y, brick2[i].x, brick2[i].y) < 50) {
          brick2[i].breakValue += 6;
        } else if (dist(ball.x, ball.y, brick2[i].x, brick2[i].y) < 100) {
          brick2[i].breakValue += 4;
        } else if (dist(ball.x, ball.y, brick2[i].x, brick2[i].y) < 150) {
          brick2[i].breakValue += 2;
        }
      }
    }
  }
  void keyReleased() {
    paddle.keyReleased();
  }
}