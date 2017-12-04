class BeerPong {
// declare paddles (might do a different class for that...
  Paddle paddle1;
  Paddle paddle2;
  Beer beer;

  BeerPong() {
    paddle1 = new Paddle(15, 90, 10, 15, height/2, 10, new PVector(0, 0));
    paddle2 = new Paddle(15, 90, 10, width-15, height/2, 10, new PVector(0, 0));
    beer=new Beer(2, 2, 2);
  }

  void drawBeerPong() {
    text("BEER PONG", width/2, height/2);
    rect(width/2, 0, 3, width);
  }
}