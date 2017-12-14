class CatPong {

  Paddle catPaddle; // declare paddle
  Item[] things = new Item[17]; //array of things to be thrown around
  cat catto; // cat tossing objects
  float numOfItems = 0; // # of items
  int interval = 3000; //3 seconds
  int lastSpawn = 0;
  float easing = 0.05; // easing for the cat animation
  float targetX; // target for ease in

  int catPush = 0; //time at which the cat pushed an object
  int catTime = 500; // delay between the push and changing back to idle

  boolean rules = false; // boolean to determine whether to display the rules.
  int saved = 0; //objects saved from cat
  int lost = 0; // fallen objects

  CatPong() {
    //new paddle
    catPaddle = new Paddle(90, 15, 0, width/2, height - 15, 10);

    // go through array of objects
    for (int i = 0; i < 17; i++) {
      things[i] = new Item(new PVector(0, 0), new PVector(0, 0), new PVector(random(0, width-60), 100));
    }
    // new cat
    catto = new cat(int(random(0, width)), 1);
  }
  void drawCatPong() {

    // go through instructions if they haven't been read yet
    if (!rules) {
      instructions();
    } 
    //otherwise start game
    else if (rules) {
      //if you saved 10 objects, game's over
      if (saved >=10) {
        win();
      } 
      // same if you drop 5
      else if (lost >=5) {
        loss();
      } 
      // otherwise, game on!
      else {
        game();
      }
    }
  }

  void keyPressed() {
    // if player is reading the rules, x brings them to the game
    if (!rules) {
      if (key == 'x') {
        rules = true;
      }
    }
    catPaddle.keyPressed();
    if (key == 'q') {
      //reset everything
      lost = 0;
      saved = 0;
      numOfItems = 0;
      catto.state = 1;
      rules = false;
      interval = 3000;
      for (int i = 0; i < things.length; i++) {
        things[i].state = 0;
        things[i].acceleration = new PVector(0, 0);
        things[i].gravity = new PVector(0, 0);
        things[i].location = new PVector(random(0, width-60), 100);
      }
    }
  }

  void keyReleased() {
    catPaddle.keyReleased();
  }
  void moveCat() { 

    // when an object is on the shelf, ease in cat towards object.
    if (catto.state == 2) {
      float dx = targetX - catto.x;
      catto.x += dx * easing;
    }
    // if push happened more than 1/2 second ago, reset cat state
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
          //change cat sprite depending on the position of the object
          if (catto.x>things[i].location.x) {
            catto.left = true;
          } else {
            catto.left = false;
          }
          // put cat in chase mode
          catto.state = 2; // set cat to move
          targetX= things[i].location.x; // set target to that objects location
          if (/*left*/catto.x+catto.sprite0.width > things[i].location.x  && /*right*/catto.x < things[i].location.x + things[i].pic.width) { // if cat is touching object
            boop.play();
            catto.state = 3; // set cat to push
            catPush = millis(); // set timer
            things[i].acceleration.x = 3.1; //set acceleration to move object
            things[i].acceleration.y = 5.5;
            things[i].gravity.x = 0;
            things[i].gravity.y = 0.2;
            // set state of thing
            things[i].state = 1;
          }
        }
      }
      // if an object goes through the top, its saved
      if (things[i].location.x<=0) {
        caught.play();
        saved++;
      } 
      // else its lost
      else if (things[i].location.x>=height) {
        oops.play();
        lost++;
      }
    }
  }
  // spawn objects on the shelf
  void spawn() {
    //if the interval has passed
    if (millis() - lastSpawn > interval)
    {
      // increase number of items by one
      numOfItems++;
      // start the timer again
      lastSpawn = millis();
      // reduce interval so objects spawn faster and faster and faster
      if (interval > 1000) {
        interval-=200;
      }
    }
  }

  // ******************** game states ***********************

  void instructions() {
    fill(255);
    text("Use ARROW KEYS to move the paddle!\nCatch the objects the cat drops!\nPress X to begin!\nPress Q to go back to main menu", width/2, height/2);
  }
  void game() {
    background(150);
    // create shelf
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);

    // display paddle, objects, and cat
    catPaddle.display();
    catPaddle.update();
    catto.display();
    checkItems();

    // spawn objects
    spawn();

    //move cat
    moveCat();

    //display scores
    fill(255);
    text("LOST " + lost, 300, 300);
    text("SAVED " + saved, 300, 400);
  }
  void win() {
    background(150);

    // create "shelf" again
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);

    // display cat
    catto.display();
    catto.state = 4;
    fill(255);
    text("YOU WIN\nPress Q to go back to the menu.", width/2, height/2);
  }
  void loss() {
    background(150);

    // create shelf
    fill(0);
    rectMode(CENTER);
    rect(width/2, (height/4)*3, width, height);

    //display cat
    catto.display();
    catto.state = 5;
    fill(255);
    text("YOU LOSE\nPress Q to go back to the menu.", width/2, height/2);
  }
}