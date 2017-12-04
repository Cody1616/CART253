class HeadBrick {

  Paddle headPaddle;
  Ball headBall;
  Minim minim;
  AudioInput mic; // The class that lets us get at the microphone
  Capture video;


  HeadBrick(PApplet applet) {
    video = new Capture(applet, 640, 480, 30); // "this" isnt working
  }

  // draw void
  void drawHeadBrick() {
    text("HEAD MEET BRICKS", width/2, height/2); // placeholder/title
    // call functions
  }

  // void where picture is taken
  void screenGrab() {
    text("press x to take picture, place face in circle", width/2, height-30);
    ellipse(width/2, height/2, 100, 100); // ellipse to place face in
    // play video
    // one x is hit, grab that frame, and stop the recording
    // once we have a photo, go to isthisRight()
  }

  void startCapture() {
    video.start();
  }


  // void where the player decides if the picture is good
  void isThisRight() {
    text("is this picture ok? (y/n)", width/2, height/2);
    if (keyCode == 'y') {
      // go to noiseGrab
    } else if (keyCode == 'n') {
      // go back to screenGrab
      // delete whats in the image file
    }
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
}