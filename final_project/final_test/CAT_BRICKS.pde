class CatPong {

  Paddle catPaddle; // declare paddle
  Item[] things = new Item[15]; //array of things to be thrown around
  cat dengCatto; // cat tossing objects
  float numOfItems = 1; // # of items
  int inc = 0; 
  int div = 500;
  float easing = 0.05; // easing for the cat animation
  float targetX; // target for ease in

  CatPong() {

    catPaddle = new Paddle(90, 15, 0, width/2, height - 15, 10, new PVector(0, 0));
    for (int i = 0; i < 15; i++) {
      things[i] = new Item(new PVector(random(0, width), 100), new PVector(0, 0), new PVector(0, 0.2));
    }
    dengCatto = new cat(int(random(0, width)), 1);
  }
  void drawCatPong() {

    background(150);
    
    // create shelf
    text("CAT PONG", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);
    
    // display paddle and cat
    catPaddle.display();
    catPaddle.update();
    
    dengCatto.display();
    
    // go through items and display/update/check collisions
    for (int i = 0; i < numOfItems; i++) {
      things[i].display();
      things[i].update();
      things[i].collide(catPaddle);
      
      if (things[i].location.y <100) { // if theres an object on the shelf
        dengCatto.state = 2; // set cat to move
        targetX= things[i].location.x; // set target to that objects location
      }
      if (things[i].location.x +10 == dengCatto.x) { // if cat is touching object
        dengCatto.state = 3; // set cat to push
        things[i].acceleration.x = 3.1; //set acceleration to move object
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
  void moveCat() { // when an object is on the shelf, ease in cat towards object.
    if (dengCatto.state == 2) {
      float dx = targetX - dengCatto.x;
      dengCatto.x += dx * easing;
    }
  }
}