class RealBrick {

  Paddle paddle;
  Ball ball;
  Capture video;

  RealBrick() {
    //video = new Capture(this, 640, 480, 30); // "this" isnt working
    //video.start();
  }

  void drawRealBrick() {
    text("REAL BRICKS", width/2, height/2);
    /*
    pushMatrix();
     imageMode(CENTER);
     translate(width/2, height/2);
     scale(-1, 1);
     // place video image
     image(video, 0, 0);
     popMatrix();*/
  }
}