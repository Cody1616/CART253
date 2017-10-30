float x = 0;
color circleColor;
int counter = 0; //counter for spiral
float spacing = 0.1; // this is to change the angle in the spiral

float r = 0; // radius
float theta = 0; //spiral angle

void setup() {
  size(600, 600);
  fill(255);
  background(0);
  translate(width/2, height/2);
}
void draw() {
  float y = 127 + (sin(x) * 127); // several sine functions to offset the colors and 
  float z = 127 + (sin(x + 30) * 127); // create a looping rainbow gradient effect
  float w = 127 + (sin(x + 60) * 127);
  circleColor = color(int(y), int(z), int(w)); 
  x += 0.05;
  text("Press SPACE to reset canvas", 10, 20); // forgot to change the fill, 
  // but decided to keep it that way because it looks cool
  if (counter%3 == 0) { //using modulo to switch between the two voids
    rainbowNS();
  } else if (counter%3 == 1) {
    rainbowStroke();
  } else if (counter%3 == 2) {
    spiral();
  }
}


void mouseClicked() {
  counter++; // add to the modulo counter every click
}
void keyPressed() { // if space is pressed, it resets the canvas (ie it resets the BG)
  if (key == ' ') {
    background(0);
  }
  else if (key == 's') // to change the increment for the spiral angle
  {
  spacing+=0.5;
  if(spacing > 5){
  spacing = 0.1; // reset incrementing
  }
  }
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
void spiral() {
  text("press S to try something different!", 40, 40);
  
  float x = r*cos(theta);
  float y = r*sin(theta);

  noStroke();
  fill(circleColor);
  ellipse(x+mouseX, y+mouseY, 50, 50);
  // increment
  theta+=spacing;
  r+=0.5;
  if(r>400){ // if the spiral gets too big, go back to 0
  r=0;
  }
}