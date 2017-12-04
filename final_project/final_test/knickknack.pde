class Thing {

  PImage pic; //to have different images later
  PVector gravity; 
  PVector acceleration; 
  PVector location;
  color c; // temporary color

  Thing(PVector g, PVector acc, PVector loc) {
    gravity = g;
    acceleration = acc;
    location = loc;
    int m = int(random(1, 5));
    switch(m) {
    case 1: 
      c = color(255);
      break;
    case 2: 
      c = color(200);
      break;
    case 3: 
      c = color(150);
      break;
    case 4: 
      c = color(100);
      break;
    case 5: 
      c = color(50);
      break;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(location.x, location.y, 20, 20);
  }

  void update() {
    location.add(acceleration);
    acceleration.add(gravity);
  }

  void bounce() {
    if ((location.x > width) || (location.x < 0))
    {
      acceleration.x = -acceleration.x;
    }
    if (location.y > height) {
      noLoop();
    }
    if (location.y < 0) {
      noLoop(); // stop the loop
    }
  }
}