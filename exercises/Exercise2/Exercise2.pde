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
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);

//ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

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

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}
/* starting when i = 0, and as long as i is under numStatic, with i increasing by 
 1 every loop
 set x to a random place on the window
 same with y
 set static to a random number between the Min and Max declared at the beginning
 fill with static color
 make a rectangle with the random coordinates x and y declared earlier in the function
 and with the random size
 */
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
  }
}
/* add paddle velocity to paddlex (distance)
 paddle x is constrained to the bottom of the screen*/
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}
/* In this function: ball goes a bit further on x and y axis (so it moves)
 3 more functions are run
 */
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}
/*In this function: 
 function rectmode is done in center
 noStroke
 fill with paddle color declared at beginning
 draw a rectangle with predetermined positions and size*/
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  
  //CHANGED: when ball is going down, draw tons of little rectangles in random colors. (Change 2)
  if (ballVY < 0) {
    fill(255);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
  } else {
    int currX = paddleX - paddleWidth/2;
    while (currX<paddleX+paddleWidth/2) {
      fill(random(100));
      rect(currX, paddleY, 5, paddleHeight);
      currX+=5;
    }
  }
  biggerPaddle(); //run this
}

//CHANGED (3)
void biggerPaddle() {
  if (ballColor < 55) {
    paddleWidth = 250; //check if the ball is dark, make the paddle twice as long
  }
}
/* In this function: wow this is the same as above but with a ball instead
 also the ball is a square O_O will have to correct that. BALLS MUST BE ROUND*/
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

/* In this function: if handleBallHitPaddle is true (so if the ball hits the paddle)
 set paddle position
 and reverse the speed so it bounces off the paddle*/
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
    //CHANGED: whenever the ball hits the paddle, change color. when its black, go back to white (change 1)
    ballColor = ballColor - 50;
    if (ballColor <6) {
      ballColor = 255;
      counter ++;
    }
  }
}
/*here, the boolean ballOverlapsPaddle
 if the ball is at the same level as the paddle
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
 if ballOffBottom is true (if the ball went off screen down)
 set the ball position to middle of screen */
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

/* in this function: 
 if the ball position is at the wall
 reverse
 if its the other wall
 reverse
 if it hits the ceiling
 also reverse (but on y axis)*/
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

/* function for keypressed
 if left is pressed
 paddle goes in opposite direction
 if right, paddle goes the other way*/
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

/* Function key released
 if left is pressed AND paddlevelocity is less than 0
 bring PVX to 0
 else if (the opposite scenario with right pressed and above zero
 bring PVX back to 0)*/

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
} 