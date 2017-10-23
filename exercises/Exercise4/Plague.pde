class Plague {
  // 
  int moveEnergy;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(100, 100, 255); //light blue

  Plague(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }

  void update() {
    int xMoveType = floor(random(-2, 2));
    int yMoveType = floor(random(-2, 2));
    x += size * xMoveType;
    y += size * yMoveType;

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
  }

  void draw() {
    fill(fill); 
    noStroke();
    rect(x, y, size, size);
  } 

  void collide(Griddie other) {
    if (x == other.x && y == other.y){
    
    }
  } //gets faster when colliding with griddie
}