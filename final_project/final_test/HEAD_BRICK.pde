class HeadBrick {

  Paddle headPaddle;
  Ball headBall;
  Minim minim;
  AudioInput mic; // The class that lets us get at the microphone
  Capture video;
  boolean gotFrame = false;
  PImage ball;

  HeadBrick(PApplet applet) {
    video = new Capture(applet, 640, 480, 30); // "this" isnt working
  }

  // draw void
  void drawHeadBrick() {
    println(gotFrame);
    text("HEAD MEET BRICKS", width/2, height/2); // placeholder/title
    if (gotFrame == false) {
      screenGrab();
    } else if (gotFrame == true) {
      isThisRight();
    }
    // call functions
  }
  void handleVideoInput() {
    // Check if there's a frame to look at
    if (!video.available()) {
      // If not, then just return, nothing to do
      return;
    }

    // If we're here, there IS a frame to look at so read it in
    video.read();
  }
  // void where picture is taken
  void screenGrab() {

    imageMode(CENTER);
    image(video, width/2, height/2);
    handleVideoInput();
    fill(255);
    text("press x to take picture, place face in circle", width/2, height-30);
    stroke(255);
    strokeWeight(10);
    fill(255, 0);
    rectMode(CENTER);
    rect(width/2, height/2, 300, 300); // ellipse to place face in
  }

  void startCapture() {
    video.start();
  }
  void endCapture() {
    video.stop();
  }

  // void where the player decides if the picture is good
  void isThisRight() {
    image(ball, width/2, height/2);
    fill(255);
    text("is this picture ok? (y/n)", width/2, height-30);
  }
  // void where sound is recorded
  void noiseGrab() {
    text("press x to record, y to stop recording (if you dont know what to say, say OW!)", width/2, height/2);
    // once we have a sound, go to isSoundRight()
  }


  //void to let the player decide if sound is good
  void isSoundRight() {
    text("is this sound right? (Y/N)", width/2, height/2);
    // playback sound over and over again
    if (keyCode == 'y') {
      // go to game
    } else if (keyCode == 'n') {
      // go back to noiseGrab
    }
  }

  // void for the game!
  void gameHeadBrick() {
    headPaddle.display();
    headPaddle.update();
    headBall.display();
    headBall.update();
    // map person's face on ball
  }
  // if win:
  void win() {
  }

  void gameOver() {

    // if person lost:
  }

  void keyPressed() {
    if (keyCode == 'x'&& gotFrame == false) {
      gotFrame = true;
      background(0);
      PImage p = video.get(150, 100, 300, 300);
      image(p, width/2, height/2);
      endCapture();
      save("frame.tif");
      ball = loadImage("frame.tif");
      
    }
    else if (gotFrame == true) {
      if (keyCode == 'y') {
        // go to noiseGrab
      } 
      else if (keyCode == 'n') {
        gotFrame = false;
        startCapture();
      }
    }
  }
}