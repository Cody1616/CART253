// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

//CHANGE 1: The scores!
int score1 = 0;
int score2 = 0;

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
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

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

  //add a line in the middle
  rectMode(CENTER);
  fill(int(random(200, 255)));
  rect(width/2, height/2, 10, height);

  //CHANGE 1: Display scores
  fill(200, 0, 0);
  textSize(30);
  text("Player 1: " + score1, 20, 30);
  fill(0, 0, 200);
  textSize(30);
  text("Player 2: " + score2, width-200, 30);

  if (score1 < 10&&score2 < 10) {
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
  } else if (score1 == 10) {
    fill(int(random(150, 255)));
    textAlign(CENTER);
    textSize(int(random(80, 150)));
    text("PLAYER 1\n WINS!!", width/2, height/2);
  } else if (score2 == 10) {
    fill(int(random(150, 255)));
    textAlign(CENTER);
    textSize(int(random(80, 150)));
    text("PLAYER 2\n WINS!!", width/2, height/2);
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