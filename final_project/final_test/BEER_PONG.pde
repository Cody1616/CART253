class BeerPong {

  Paddle paddle1;
  Paddle paddle2;

  BeerPong() {
    paddle1 = new Paddle(15, 90, 10, 15, height/2, 10);
    paddle2 = new Paddle(15, 90, 10, width-15, height/2, 10);
  }

  void drawBeerPong() {
    text("BEER PONG", width/2, height/2);
  }
}