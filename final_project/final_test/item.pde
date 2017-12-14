class Item {

  PImage pic; //to have different images later
  PVector gravity; 
  PVector acceleration; 
  PVector location;
  color c; // temporary color
  
  int state = 0;
  // 0 = on shelf
  // 1 = bouncing about
  // 2 = offscreen, lost.
  
 


  Item(PVector g, PVector acc, PVector loc) {
    gravity = g;
    acceleration = acc;
    location = loc;
    int m = int(random(1, 5));

    // display random items
    switch(m) {

    case 1: 
      pic = loadImage("items/items_0.png");
      break;
    case 2: 
      pic = loadImage("items/items_1.png");
      break;
    case 3: 
      pic = loadImage("items/items_2.png");
      break;
    case 4: 
      pic = loadImage("items/items_3.png");
      break;
    case 5: 
      pic = loadImage("items/items_4.png");
      break;
    }
  }

  void display() {
    imageMode(CORNER);
    image(pic, location.x, location.y);
  }

  void update() {
    location.add(acceleration);
    acceleration.add(gravity);
    bounce();
  }

  void bounce() {
    if ((location.x+pic.width > width) || (location.x < 0))
    {
      acceleration.x = acceleration.x*-1;
      ow.play();
    }
    if (location.y+pic.height < 0) {
      state = 2;
      CB.saved++;
    }
    else if (location.y-pic.height > height){
        state = 2;
        CB.lost++;
    }
  }
  void collide(Paddle paddle) { 
    // collision with paddle
    if (/*left*/location.x+pic.width >= paddle.x-paddle.pWidth/2 && /*right*/location.x<= paddle.x +paddle.pWidth/2 
        && /*up*/ location.y + pic.height >= paddle.y-paddle.pHeight && /*down*/ location.y <= paddle.y + paddle.pWidth/2) {
      //place on top of paddle
      location.y = paddle.y-paddle.pWidth/2-pic.height;
      acceleration.y = acceleration.y * -1.25; 
      bounce.play();
    }
  }
}

/*// Add velocity to the location.
 location.add(velocity);
 // Add gravity to velocity
 velocity.add(gravity);
 
 // Bounce off edges
 if ((location.x > width) || (location.x < 0)) {
 velocity.x = velocity.x * -1;
 }
 if (location.y > height) {
 // We're reducing velocity ever so slightly 
 // when it hits the bottom of the window
 velocity.y = velocity.y * -0.95; 
 location.y = height;
 }*/