color backgroundColor = color(200, 150, 150);
Bouncer bouncer; //declaring 2 bouncers
Bouncer bouncer2;

void setup() {
  size(640, 480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2, height/2, 2, 2, 50, 100, color(150, 0, 0, 50), color(255, 0, 0, 50), color(200, 0, 0, 50));
  bouncer2 = new Bouncer(width/2, height/2, -2, 2, 50, 100, color(0, 0, 150, 50), color(0, 0, 255, 50), color(0, 0, 200, 50));
  // make 2 boucers with these settings, place them at the center to begin)
  //CHANGE2: added extra variables
}

void draw() {
  bouncer.update(); //run update for both bouncers, as well as the draws for both bouncers
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}
//CHANGED: new void for click
void mousePressed(){
bouncer.clickBouncer();
bouncer2.clickBouncer();
}