class Bouncer { //making a new class - bouncer

  int x;
  int y;
  int vx;
  int vy; // position and velocity
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;

  //create a bouncer with all the things above
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }
  //move the balls around
  void update() { //move ball 
    x += vx;
    y += vy;

    handleBounce(); //call in 2 functions
    handleMouse();
  }

  void handleBounce() { //CHANGED: ball wraps around the screen when it hits a wall IF
  //they are headed in the wall's direction (instead of spawning there)
    if (x - size/2 < 0&&vx<0) {  
      x +=width-size/2;
      
    }
    if (x + size/2 > width && vx>0) {
      x=size/2;
    }

    if (y - size/2 < 0 && vy<0) {
      y+=height-size/2;
    }

    if (y + size/2 > height && vy>0) {
      y=size/2;
    }

    x = constrain(x, size/2, width-size/2); //constrain position to within size
    y = constrain(y, size/2, height-size/2);
  }

  void handleMouse() {
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor; //if the mouse is hovering above the object, change color
    } else {
      fillColor = defaultColor; //if not, keep the same color
    }
  }

  void draw() { //every frame, dont have a stroke, make an ellipse in this color
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}