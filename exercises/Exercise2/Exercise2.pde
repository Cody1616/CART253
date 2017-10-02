color backgroundColor = color(0);

//background static
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

//paddle 
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 130;
int paddleHeight = 16;
color paddleColor = color(255);

//ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
int ballColor = 255;

int counter = 0;

//setup: size, paddle and ball
void setup() {
  size(640, 480);

  setupPaddle();
  setupBall();
}

// setting up paddle size and velocity
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

// setting up ball size and speed
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

//every frame, this stuff happens.
void draw() {
  background(backgroundColor);
  Score();
  drawStatic();
  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}

void Score() { //displays score (added by Cody)
  fill(255);
  text("Score:" + counter, 10, 20);
}

/* loop to set rectangles to random places with random sizes
 fill with static color*/
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}

/* makes paddle move sideways
 paddle is constrained to the bottom of the screen*/
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

/* this function makes the ball move
 3 more functions are run*/
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

/*In this function: a ball is drawn in the center
 run biggerPaddle (Added by Cody)
 fill with paddle color declared at beginning
 draw a rectangle with predetermined positions and size if ball is going up
 if not, make tons of little flickering rectangles*/
void drawPaddle() {
  biggerPaddle();
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  //CHANGED: when ball is going down, draw tons of little rectangles in random colors. (Change 2)
  if (ballVY < 0) {
    fill(255);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
  } else {
    int currX = paddleX - paddleWidth/2;
    while (currX < paddleX + paddleWidth/2) {
      fill(random(100));
      rect(currX, paddleY, 5, paddleHeight);
      currX+=5;
    }
  }
}

//CHANGED (3)
void biggerPaddle() { //check if the ball is dark, make the paddle twice as long if so
  if (ballColor > 100) {
    paddleWidth = 130; 
  } else {
    paddleWidth = 250;
  }
}

// In this function: ball is drawn
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

/* In this function: if the ball hits the paddle
 set ball to paddle position
 and reverse the speed so it bounces off the paddle*/
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    //CHANGED: whenever the ball hits the paddle, change color. 
    ballColor = ballColor - 50;
    if (ballColor <6) {
      ballColor = 255;//when its black, go back to white (change 1)
      counter ++;//point counter
    }
  }
}

/*here, the boolean ballOverlapsPaddle
 when the ball is at the same level as the paddle
 if ball is on paddle, return true
 if not, return false */
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

/* in this function
 if the ball went off screen below the paddle
 set the ball position to middle of screen. Also, reset color */
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
    ballColor = 255; //CHANGED: reset ball color - i noticed that if the ball color is black, its hard to see. if you lose it, its hard ti 
    //find it and hit it again. So i just reset the color (change 1)
  }
}

// bool: return true if the ball is offscreen
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

// this function makes the ball bounce off the walls
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

//links keys to paddle movement
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

//makes sure the paddle stops when key is released
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
} 