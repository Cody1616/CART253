int game;
ToughBricks TB;
Menu menu;


void setup() {
  game = 0;
  TB = new ToughBricks();
  menu = new Menu();
  size(600, 400);
}

void draw() {
  background(0);
  switch(game) {
  case 1: 
    TB.drawToughBricks();
    break;
  case 0: 
    menu.display();
    break;
  }
}

void keyPressed() {
  switch(game) {
  case 0: 
    menu.keyPressed();
    break;
  case 1: 
    TB.keyPressed();
    break;
  }
}
void keyReleased() {
  switch(game){
  case 1: TB.keyReleased();
  }
}