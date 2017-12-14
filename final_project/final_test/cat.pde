class cat {

  int y = 20;
  int x;
  int state;
  boolean left = false; // for cat to face left
  boolean tail = true; // for tail movements. true means the tail is up.
  PImage sprite0, sprite1, sprite2, sprite3, sprite4, sprite5, sprite6, sprite7, sprite8;

  cat(int tx, int ts) {
    x = tx;
    state = ts;
    sprite0 = loadImage("catsprite/sprite_0.png");
    sprite1 = loadImage("catsprite/sprite_1.png");
    sprite2 = loadImage("catsprite/sprite_2.png");
    sprite3 = loadImage("catsprite/sprite_3.png");
    sprite4 = loadImage("catsprite/sprite_4.png");
    sprite5 = loadImage("catsprite/sprite_5.png");
    sprite6 = loadImage("catsprite/sprite_6.png");
    sprite7 = loadImage("catsprite/sprite_7.png");
    sprite8 = loadImage("catsprite/sprite_8.png");
  }

  void display() {

    x = constrain(x, 0, width-sprite0.width);
    switch(state) {
    case 1: //idle
      idle();
      break;
    case 2: // if theres an item on the "shelf", have the cat chase it until it touches it
      chase();
      break;
    case 3: // if cat is touching item, push, then return to idle
      push();
      break;
    case 4: // if you win, display this sprite
      victory();
      break;
    case 5: // if loss...
      defeat();
      break;
    }
  }

  void idle() {
    imageMode(CORNER);
    if (int(millis()/1000)%2 == 0) { // if the # of seconds is even, cat tail changes.
      tail = true;
    } else {
      tail = false;
    }

    if (tail) {
      image(sprite2, x, y);
    } else {
      image(sprite3, x, y);
    }
    if (int(millis()%5000) > 0 && int(millis()%5000) < 100) { //blink every now and then for half a second
      if (tail) {
        image(sprite0, x, y);
      } else {
        image(sprite1, x, y);
      }
    }
  } // cat sprite when idle

  void chase() {// cat sprite when going for an item
    imageMode(CORNER);
    if (left) {
      image(sprite7, x, y);
    } else { 
      image(sprite4, x, y);
    }
  } 

  void push() { // cat sprite when pushing an item
    imageMode(CORNER);
    if (left) {
      image(sprite8, x, y);
    } else {
      image(sprite5, x, y);
    }
  }
  void victory() {
    imageMode(CORNER);
    image(sprite6, x, y);
  }

  void defeat() {
    imageMode(CORNER);
    image(sprite1, x, y);
  }
}