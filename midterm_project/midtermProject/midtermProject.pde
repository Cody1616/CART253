// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

//CHANGE 1: The scores! (and a variable for size)
int score1 = 0;
int score2 = 0;
int scoreSize1 = 200;
int scoreSize2 = 200;
// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  // CHANGE 5: changed the controls
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 5, width/2-10, 'w', 's', 'a', 'd');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, width/2+5, width-5, 'i', 'k', 'j', 'l');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);
  //CHANGE 3: added some rectangles on each side
  //int leftColor = int(random(150, 255));
  int leftX = 0;
  while (leftX < width/2) {
    fill(random(100, 200), 0, 0);
    rect(leftX, height/2, 5, height);
    leftX+=5;
  }
  int rightX = width/2;
  while (rightX < width) {
    fill(0, 0, random(100, 200));
    rect(rightX, height/2, 5, height);
    rightX+=5;
  }   

  //CHANGE 2: if neither score is at 10, run the game
  if (score1 < 10&&score2 < 10) { 
    //CHANGE 1: Display scores
    textAlign(CENTER, CENTER);
    fill(255, 150);
    textSize(scoreSize1);
    text(score1, width/4, height/2);
    fill(255, 150);
    textSize(scoreSize2);
    text(score2, (width/4*3), height/2);


    //display controls
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(20);
    text("Controls: WASD", width/4, height-30);
    fill(255);
    textSize(20);
    text("Controls: IJKL", (width/4*3), height-30);

    // Update the paddles and ball by calling their update methods
    leftPaddle.update();
    rightPaddle.update();
    ball.update();

    // Check if the ball has collided with either paddle
    ball.collide(leftPaddle);
    ball.collide(rightPaddle);

    // Check if the ball has gone off the screen
    // CHANGE 1: check which side as well
    if (ball.OffScreen() == 1) {
      // If it has, reset the ball
      score2++;
      ball.reset();
    } else if (ball.OffScreen() == 2) {
      score1++;
      ball.reset();
    }



    // Display the paddles and the ball
    leftPaddle.display();
    rightPaddle.display();
    ball.display();
  }


  //CHANGE 2: if one score reaches 10, display a message saying "X WON!!!1!1!!!"
  else if (score1 == 10) {
    fill(int(random(150, 255)));
    textAlign(CENTER, CENTER);
    textSize(80);
    text("GAME OVER\nPLAYER 1\nWINS!!", width/2, height/2);
  } else if (score2 == 10) {
    fill(int(random(150, 255)));
    textAlign(CENTER, CENTER);
    textSize(80);
    text("GAME OVER\nPLAYER 2\nWINS!!", width/2, height/2);
  }
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}