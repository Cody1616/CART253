class CatPong {

  Paddle catPaddle; // declare paddle
  Thing[] things = new Thing[15];
  float numOfItems = 1;
  float inc = 0.1; 

  CatPong() {

    catPaddle = new Paddle(90, 15, 10, width/2, height - 15, 10, new PVector(0, 0));
    for (int i = 0; i < 15; i++) {
      things[i] = new Thing(new PVector(), new PVector(), new PVector());
    }
  }
  void drawCatPong() {
    if (inc%2 == 0) {
      numOfItems++;
    }
    inc+= random(0.1, 1);

    background(150);
    text("CAT PONG", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);
    catPaddle.display();
    catPaddle.update();
    for (int i = 0; i < numOfItems; i++) {
      things[i].display();
      things[i].update();
    }
  }
}