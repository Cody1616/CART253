int game;
ToughBricks TB;
Menu menu;
import processing.sound.*;  // import libraries
import processing.video.*;


void setup() {
  game = 0;
  TB = new ToughBricks();
  menu = new Menu();
  size(600, 400);
}

void draw() {
  background(0);
  switch(game) {
  case 0: 
    menu.display();
    break;
  case 1: 
    TB.drawToughBricks();
    break;
  case 2: // Cat Brick
  case 3: // Beer Pong
  case 4:
    // Circle Brick
  case 5: // Head Brick
  case 6: // Real Brick
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
  switch(game) {
  case 1: 
    TB.keyReleased();
  }
}

void askPlayerNum(){
text("enter # of players (max 4)", width/2, height/2);


}