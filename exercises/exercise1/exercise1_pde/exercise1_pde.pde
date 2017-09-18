final int CIRCLE_SPEED = 7;
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(250, 150, 150);
final color STROKE_COLOR = color(250, 150, 150);
final int CIRCLE_SIZE = 50;
//positions and velocity
int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480);
  circleX = width/2; //set the circle position to the middle of the grid(?)
  circleY = height/2;
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  fill(NO_CLICK_FILL_COLOR); //fill is initialy red
  background(BACKGROUND_COLOR);
}
//every frame, this happens
void draw() {
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); //if the distance is smaller than half the circle size... make it blue!
  } else {
    fill(NO_CLICK_FILL_COLOR);//otherwise red
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
  background(BACKGROUND_COLOR); // so if clicked, the previous circles disappear 
}