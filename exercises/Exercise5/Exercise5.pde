float x = 0;
color circleColor;
int counter = 0;

void setup() {
  size(600, 600);
  fill(255);
  background(0);
}
void draw() {
  if (counter%2 == 0) { //using modulo to switch between the two voids
    rainbowNS();
  } 
  
  else if (counter%2 == 1){
    rainbowStroke();
  }
}


void mouseClicked() {
  counter++; // add to the modulo counter every click
}

void rainbowNS() {
  float y = 127 + (sin(x) * 127); // several sine functions to offset the colors and 
  float z = 127 + (sin(x + 30) * 127); // create a looping rainbow gradient effect
  float w = 127 + (sin(x + 60) * 127);
  circleColor = color(int(y), int(z), int(w)); 
  x += 0.05;

  ellipseMode(CENTER);
  fill(circleColor, 100);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50); // draws circle where the mouse is, but no stroke
}

void rainbowStroke() {  
  float y = 127 + (sin(x) * 127); // several sine functions to offset the colors and 
  float z = 127 + (sin(x + 30) * 127); // create a looping rainbow gradient effect
  float w = 127 + (sin(x + 60) * 127);
  circleColor = color(int(y), int(z), int(w)); 
  x += 0.05;

  ellipseMode(CENTER);
  fill(circleColor, 100);
  stroke(5);
  ellipse(mouseX, mouseY, 50, 50); // draws circle where the mouse is, but with stroke
  
}