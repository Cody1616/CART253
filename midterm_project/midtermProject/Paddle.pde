// Paddle
//
// A class that defines a paddle that can be moved up and down on the screen
// using keys passed through to the constructor.

class Paddle {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 70;
  int WIDTH = 16;

  // The position and velocity of the paddle (note that vx isn't really used right now)
  int x;
  int y;
  int vx;
  int vy;
  int xCons1; //CHANGE 5: added a constraint variable
  int xCons2;
  // The fill color of the paddle
  color paddleColor = color(255);

  // The characters used to make the paddle move up and down, defined in constructor
  char upKey;
  char downKey;
  char leftKey;
  char rightKey;


  /////////////// Constructor ///////////////

  // Paddle(int _x, int _y, char _upKey, char _downKey)
  //
  // Sets the position and controls based on arguments,
  // starts the velocity at 0

  Paddle(int _x, int _y, int _xCons1, int _xCons2, char _upKey, char _downKey, char _leftKey, char _rightKey) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    xCons1 = _xCons1;
    xCons2 = _xCons2;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
  }


  /////////////// Methods ///////////////

  // update()
  //
  // Updates position based on velocity and constraints the paddle to the window

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;

    // Constrain the paddle's y position to be in the window
    y = constrain(y, 0 + HEIGHT/2,height - HEIGHT/2);
    x = constrain(x, xCons1, xCons2);
  }

  // display()
  //
  // Display the paddle at its location
  
  void display() {
    // Set display properties
    noStroke();
    fill(paddleColor);
    rectMode(CENTER);
    
    // Draw the paddle as a rectangle
    rect(x, y, WIDTH, HEIGHT);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  
  void keyPressed() {
    // Check if the key is our up key
    if (key == upKey) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (key == downKey) {
      // If so we want a positive y velocity
      vy = SPEED;
    }
    if (key == leftKey){
    vx = -SPEED;
    }
    else if (key == rightKey){
    vx = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (key == upKey && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == downKey && vy > 0) {
      // If so it should stop
      vy = 0;
    }
    if (key == leftKey && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (key == rightKey && vx > 0) {
      // If so it should stop
      vx = 0;
    }
  }
}