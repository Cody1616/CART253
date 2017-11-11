boolean drunk;
int paddleH = 20;
int paddleW = 80;
float distance = 1;
void setup() {
  size(600, 600);
 
}

void draw() {
  background(0);
  if (drunk == true) {
    drunkPaddle();
  } else if (drunk == false) {
    soberPaddle();
  }
}

void soberPaddle() {
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, paddleW, paddleH);
}
void drunkPaddle() {
  noStroke();
  fill(random(200, 255), 150);
  rect(width/2, height/2, paddleW, paddleH);
  rect(width/2+(noise(distance)*50), height/2, paddleW, paddleH);
  rect(width/2-(noise(distance)*50), height/2, paddleW, paddleH);
  distance++;
}

void keyPressed() {
  if (key == ' ') {
    if(drunk == true){
    drunk = false;
    }
    else if (drunk == false){
    drunk = true;
    }
  }
}