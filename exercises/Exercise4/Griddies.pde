// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 0, 0);
  color plagueFill = color(0, 0, 100); // plagued color
  boolean infectedOnce = false;

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {

    // QUESTION: What is this if-statement for?

    /* ANSWER: It checks if the energy is at 0.
     If it is, ir returns true*/

    if (energy == 0) {
      return;
    }

    // QUESTION: How does the Griddie movement updating work?

    /* ANSWER: a random number between -1 and 2 is multiplied with
     the size of the griddie (so it moves x grid units in a certain direction)
     and is added to the position. */

    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    x += size * xMoveType;
    y += size * yMoveType;

    // QUESTION: What are these if statements doing?

    // ANSWER: If a griddie is off screen, it wraps around the screen

    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;

    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy, 0, maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level

  void collide(Griddie other) {
    // QUESTION: What is this if-statement for?

    // ANSWER: it checks if either energy has reached 0, and returns true if so.

    if (energy == 0 || other.energy == 0) {
      return;
    }

    // QUESTION: What does this if-statement check?

    // ANSWER: it checks if 2 griddies are bumping into each other

    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy, 0, maxEnergy);
    }
  }
  void collide(Plague other) {
    if (x == other.x && y == other.y && infectedOnce == false) { // making sure it doesnt add a victim every frame
      fill = plagueFill;
      moveEnergy = -15; // change color and up the energy cost so they waste away
      infectedOnce = true;
      victims++;
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?

    /* ANSWER: It makes it so that the opacity gets lower as
     the griddie loses energy. */

    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}