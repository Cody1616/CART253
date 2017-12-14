int game;
ToughBricks TB;
CatPong CB;
CircleBrick CiB;
HeadBrick HB;
RealBrick RB;

Menu menu;
import processing.sound.*;  // import libraries
import processing.video.*;
import ddf.minim.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


SoundFile ow;
SoundFile bounce;


void setup() {
  // variable for game choice
  game = 0;

  //declaring game classes
  TB = new ToughBricks();
  CB = new CatPong();
  CiB = new CircleBrick();
  HB = new HeadBrick(this);
  RB = new RealBrick(this);
  menu = new Menu();
  size(600, 600);

  ow = new SoundFile(this, "face/file.wav");
  bounce = new SoundFile(this, "sounds/hit2.wav");
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
    CiB.drawCircleBricks();
    break;
  case 4: 
    HB.video.start();
    HB.drawHeadBrick();
    break;
  case 5: 
    RB.drawRealBrick();
    RB.video.start();
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
  case 2:
    CB.keyPressed();
    break;
  case 3: 
    CiB.keyPressed();
    break;
  case 4:
    HB.keyPressed();
    break;
  case 5: 
    RB.keyPressed();
    break;
  }
  if (key == 'q') {
    game = 0;
  }
}

void keyReleased() {
  // and again
  switch(game) {
  case 1: 
    TB.keyReleased();
    break;
  case 2:
    CB.keyReleased();
    break;
  case 3: 
    CiB.keyReleased();
    break;
  case 4:
    HB.keyReleased();
    break;
  }
}