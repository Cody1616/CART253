Paddle paddle;
Brick[] brick1 = new Brick[10];
Brick[] brick2 = new Brick[10];
Ball ball;

void setup() { 
  size(600, 400);
  paddle = new Paddle(90, 15, 10, width/2, height - 15, 10);
  ball = new Ball(paddle.x, paddle.y, 10, 10, 10);

  for (int i = 0; i < brick1.length; i++) {
    brick1[i] = new Brick(0, i*60, 0, color(255, 0, 0));

  }
  for (int i = 0; i < brick2.length; i++) {
    brick2[i] = new Brick(0, i*60, 20, color(255, 0, 0));
  }
}
void draw() {
  background(0);
  paddle.display();
  paddle.update();
  ball.display();
  ball.update();
  for (int i = 0; i < brick1.length; i++) {
    brick1[i].display();
    brick1[i].update();
  }
  for (int i = 0; i < brick2.length; i++) {
    brick2[i].display();
    brick2[i].update();
  }
}