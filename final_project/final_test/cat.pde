class cat {
  PImage sprite;
  int y = 100;
  int x;
  int state;
  cat(int tx, int ts) {
    x = tx;
    state = ts;
  }

  void display() {
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
    fill(0, 0, 255); // blue
    rect(x, y, 40, 40);
  } // cat sprite when idle

  void chase() {// cat sprite when going for an item
  fill(0, 255, 0); // green
  rect(x, y, 40, 40);
    // if cat is touching item, push();
  } 

  void push() { // cat sprite when pushing an item
  fill(255, 0, 0); //red
  rect(x, y, 40, 40);
  }
  void victory() {
  } // sprite upon victory

  void defeat() {
  } // sprite upon defeat
}