class cat {
  PImage sprite;
  int y = 20;
  int x;
  int state;
  boolean left = false; // for cat to face left
  boolean tail = true; // for tail movements. true means the tail is up.

  cat(int tx, int ts) {
    x = tx;
    state = ts;
    sprite = loadImage("catsprite/sprite_2.png");
  }

  void display() {
    imageMode(CORNER);
    image(sprite, x, y);
    x = constrain(x, 0, width-sprite.width);
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

  void update() {
  }


  void idle() {

    if (int(millis()/1000)%2 == 0) { // if the # of seconds is even, cat tail changes.
      tail = true;
    } else {
      tail = false;
    }

    if (tail) {
      sprite = loadImage("catsprite/sprite_2.png");
    } else {
      sprite = loadImage("catsprite/sprite_3.png");
    }
    if (int(millis()%5000) > 0 && int(millis()%5000) < 100) { //blink every now and then for half a second
      if (tail) {
        sprite = loadImage("catsprite/sprite_0.png");
      } else {
        sprite = loadImage("catsprite/sprite_1.png");
      }
    }
  } // cat sprite when idle

  void chase() {// cat sprite when going for an item
    if (left) {
      sprite = loadImage("catsprite/sprite_7.png");
    } else { 
      sprite = loadImage("catsprite/sprite_4.png");
    }
  } 

  void push() { // cat sprite when pushing an item
    if (left) {
      sprite = loadImage("catsprite/sprite_8.png");
    } else {
      sprite = loadImage("catsprite/sprite_5.png");
    }
  }
  void victory() {
    sprite = loadImage("catsprite/sprite_6.png");
  }

  void defeat() {
    sprite = loadImage("catsprite/sprite_2.png");
  }
}