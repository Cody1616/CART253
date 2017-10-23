class Plague {
  // 
  int moveEnergy;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int vx;
  int vy;
  int speed = 1;
  int size;
  int energy;
  color fill = color(100, 100, 255); //light blue

  Plague(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }

  void update() {
    x += vx;
    y += vy;

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
    if (x == other.x && y == other.y) {
    }
  } //gets faster when colliding with griddie
  void keyPressed() {
    if (keyCode == LEFT) {
      vx = -speed*gridSize;
    } else if (keyCode == RIGHT) {
      vx = speed*gridSize;
    } else if (keyCode == UP) {
      vy = -speed*gridSize;
    } else if (keyCode == DOWN) {
      vy = speed*gridSize;
    }
  }
  void keyReleased() {
    if (keyCode == LEFT || vx <0){
    vx = 0;
    }
    else if (keyCode == RIGHT || vx > 0){
      vx = 0;
    }
    if (keyCode == UP || vy < 0){
    vy = 0;
    }
    else if (keyCode == DOWN || vy > 0){
    vy = 0;
    }
  }
}