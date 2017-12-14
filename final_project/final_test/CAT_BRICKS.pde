class CatPong {

  Paddle catPaddle; // declare paddle
  Item[] things = new Item[15]; //array of things to be thrown around
  cat catto; // cat tossing objects
  float numOfItems = 0; // # of items
  int interval = 3000; //3 seconds
  int lastSpawn = 0;
  float easing = 0.05; // easing for the cat animation
  float targetX; // target for ease in

  int catPush = 0;
  int catTime = 500;


  int saved = 0;
  int lost = 0;

  CatPong() {

    catPaddle = new Paddle(90, 15, 0, width/2, height - 15, 10, new PVector(0, 0));
    for (int i = 0; i < 15; i++) {
      things[i] = new Item(new PVector(0, 0), new PVector(0, 0), new PVector(random(0, width-60), 100));
    }
    catto = new cat(int(random(0, width)), 1);
  }
  void drawCatPong() {

    background(150);
    println(millis());
    println(numOfItems);
    // create shelf
    text("CAT PONG", width/2, height/2);
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);

    // display paddle and cat
    catPaddle.display();
    catPaddle.update();
    catto.display();
    checkItems();

    spawn();

    moveCat();
    text("LOST " + lost, 300, 300);
    text("SAVED " + saved, 300, 400);
  }

  void keyPressed() {
    catPaddle.keyPressed();
  }

  void keyReleased() {
    catPaddle.keyReleased();
  }
  void moveCat() { // when an object is on the shelf, ease in cat towards object.
    if (catto.state == 2) {
      float dx = targetX - catto.x;
      catto.x += dx * easing;
    }
    if (catto.state == 3 && millis() > catPush +catTime) {
      catto.state = 1;
    }
  }

  void checkItems() {
    // go through items and display/update/check collisions
    for (int i = 0; i < numOfItems; i++) {
      if (things[i].state!=2) {
        things[i].display();
        things[i].update();
        things[i].collide(catPaddle);

        if (things[i].state == 0) { // if theres an object on the shelf
          if (catto.x>things[i].location.x) {
            catto.left = true;
          } else {
            catto.left = false;
          }
          catto.state = 2; // set cat to move
          targetX= things[i].location.x; // set target to that objects location
          if (/*left*/catto.x+catto.sprite0.width > things[i].location.x  && /*right*/catto.x < things[i].location.x + things[i].pic.width) { // if cat is touching object
            catto.state = 3; // set cat to push
            catPush = millis();
            things[i].acceleration.x = 3.1; //set acceleration to move object
            things[i].acceleration.y = 5.5;
            things[i].gravity.x = 0;
            things[i].gravity.y = 0.2;
            things[i].state = 1;
          }
        }
      }
      if (things[i].location.x<=0) {
        saved++;
      } else if (things[i].location.x>=height) {
        lost++;
      }

      println(things[i].state);
    }
  }

  void spawn() {
    if (millis() - lastSpawn > interval)
    {
      numOfItems++;
      lastSpawn = millis();
      if (interval > 1000) {
        interval-=200;
      }
    }
  }
}