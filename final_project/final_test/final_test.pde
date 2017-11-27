int game;
ToughBricks TB;
CatPong CB;
BeerPong BP;
CircleBrick CiB;
HeadBrick HB;
RealBrick RB;

Menu menu;
import processing.sound.*;  // import libraries
import processing.video.*;
import ddf.minim.*;





void setup() {
  
  // variable for game choice
  game = 0;
  
  //declaring game classes
  TB = new ToughBricks();
  CB = new CatPong();
  BP = new BeerPong();
  CiB = new CircleBrick();
  HB = new HeadBrick(this);
  RB = new RealBrick(this);
  menu = new Menu();
  size(600, 400);
}

void draw() {
  background(0);
  
  //switch for different games
  switch(game) {
  case 0: 
    menu.display();
    break;
  case 1: 
    TB.drawToughBricks();
    break;
  case 2: 
    CB.drawCatPong();
    break;
  case 3: 
    BP.drawBeerPong();
    break;
  case 4:
    CiB.drawCircleBricks();
    break;
  case 5: 
    HB.drawHeadBrick();
    break;
  case 6: 
    RB.drawRealBrick();
    break;
  }
}

void keyPressed() {
  
  // another switch statement for different games' keyPressed()
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
  // and again
  switch(game) {
  case 1: 
    TB.keyReleased();
  }
}

void askPlayerNum() {
  // this one is for Circle Bricks, as there can be different amount of players.
  text("enter # of players (max 4)", width/2, height/2);
}