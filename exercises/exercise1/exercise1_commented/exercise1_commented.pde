float noClickFillColor;//new variables to randomize the circle color over time.
float clickFillColor;//they are randomized in the draw void so each circle is a different color
final int CIRCLE_SPEED = 7;
//previously, the circle color changed if the mouse was in contact wwith it. Now (ie when I open this project again), 
//i decided to randomize it... random blue hues and random red hues :D
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
int CIRCLE_SIZE = 50; //final means the int cant be modified? im taking it off
//i want to make the circle bigger when the mouse is near it
int circleX; //variables for circle position and velocity
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480); //size of project
  circleX = width/2; //set the circle position to the middle of the grid(?)
  circleY = height/2;
  circleVX = CIRCLE_SPEED; //velocity is the same as CIRCLESPEED, which is 7
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  //removed original fill color since it changes every frame. Also, it couldn't
  //be resolved to a variable now that the final color is in the draw void,
  //so processing got annoyed and flagged it as an error.
  background(BACKGROUND_COLOR);
}
//every frame, this happens
void draw() {
  clickFillColor = random(100, 250); //randomizing
  noClickFillColor = random(100, 250); //randomizing
  final color NO_CLICK_FILL_COLOR = color(noClickFillColor, 100, 100); //changing the colors every frame
  final color CLICK_FILL_COLOR = color(100, 100, clickFillColor); //same with the mouse hovering near circles
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); //if the distance is smaller than half the circle size... make it blue!
    CIRCLE_SIZE = 100; //circle is bigger
  } else {
    fill(NO_CLICK_FILL_COLOR);//otherwise red
    CIRCLE_SIZE = 50; //circle back to original size
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE); //creates circle in the middle, with the predetermined circle size
  circleX += circleVX; //add velocity to position every frame (so the thing moves x pixels 
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) { //if the circle hits the border (so the position + half the circle)...
    circleVX = -circleVX;///... reverse it
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) { // same thing as above, except vertical
    circleVY = -circleVY; //reversed
  }
  
}

void mousePressed() {
  if (mouseX > width/2) {
    background(0);
  } else {
    background(255);
  }
}