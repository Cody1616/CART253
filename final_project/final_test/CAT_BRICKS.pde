class CatPong {

  Paddle catPaddle; // declare paddle
  Thing[] things = new Thing[15];
  cat dengCatto;
  float numOfItems = 1;
  int inc = 0; 
  int div = 500;
  float easing = 0.05;
  float targetX;

  CatPong() {

    catPaddle = new Paddle(90, 15, 0, width/2, height - 15, 10, new PVector(0, 0));
    for (int i = 0; i < 15; i++) {
      things[i] = new Thing(new PVector(random(0, width), 100), new PVector(0, 0), new PVector(0, 0.2));
    }
    dengCatto = new cat(int(random(0, width)), 1);
  }
  void drawCatPong() {
    if (inc%div == 0 && numOfItems<15) {
      numOfItems++;
      div-= int(random(1, 10));
    }
    inc+= int(random(1, 5));
    println(inc);

    background(150);
    text("CAT PONG", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);
    catPaddle.display();
    catPaddle.update();
    dengCatto.display();
    for (int i = 0; i < numOfItems; i++) {
      things[i].display();
      things[i].update();
      things[i].collide(catPaddle);
      if (things[i].location.y <100) {
        dengCatto.state = 2;
        targetX= things[i].location.x;
      }
      if (things[i].location.x +10 == dengCatto.x) {
        dengCatto.state = 3;
        things[i].acceleration.x = 3.1;
        things[i].acceleration.y = 5.5;
      }
    }
    moveCat();
  }

  void keyPressed() {
    catPaddle.keyPressed();
  }

  void keyReleased() {
    catPaddle.keyReleased();
  }
  void moveCat() {
    if (dengCatto.state == 2) {
      float dx = targetX - dengCatto.x;
      dengCatto.x += dx * easing;
    }
  }
}