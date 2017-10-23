// Griddies
// by Pippin Barr
// MODIFIED BY: Cody Gaudet
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
//new plague
Plague plague;

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);
  int pX = floor(random(0, width/gridSize));
  int pY = floor(random(0, height/gridSize));
  plague = new Plague(pX * gridSize, pY * gridSize, gridSize);

  // QUESTION: What does this for loop do?

  /*ANSWER: go through every griddie and gives them a random position
   Creates new griddies. */
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  plague.update();
  plague.draw();

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // ANSWER: It's to go through all the griddies in the array. if 
      // j=i, then the program would check if the griddie is colliding with itself
      if (j != i) {
        // QUESTION: What does this line check?
        // ANSWER: it checks if the griddie collides with the others. 
        griddies[i].collide(griddies[j]);
        griddies[i].collide(plague); // check if it collides with the plague
      }
    }

    // Display the griddies
    griddies[i].display();
  }
}
void keyPressed() {
  plague.keyPressed();
}
void keyReleased() {
  plague.keyReleased();
}