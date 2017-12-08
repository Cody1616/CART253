class HeadBrick {

  Paddle headPaddle;
  Ball headBall;
  Brick[] bricks = new Brick[30];

  Minim minim;
  AudioInput in; 
  AudioRecorder recorder;
  AudioOutput out;
  FilePlayer player;


  Capture video;

  int mode = 0;
  PImage ball;
  int lives = 5; // int for lives
  int destroyedBricks = 0;

  HeadBrick(PApplet applet) {
    video = new Capture(applet, 640, 480, 30); 


    minim = new Minim(applet);
    // We use minim.getLineIn() to get access to the microphone data
    in = minim.getLineIn();
    recorder = minim.createRecorder(in, "file.wav");
    out = minim.getLineOut( Minim.STEREO );


    headPaddle = new Paddle(90, 15, 0, width/2, height - 30, 10, new PVector(0, 0));
    headBall = new Ball(headPaddle.x, headPaddle.y-50, 20, 5, 5);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j< 10; j++) {
        bricks[i*10+j] = new Brick(0, j*60, i*20, color(255, 0, 0));
      }
    }
  }

  // draw void
  void drawHeadBrick() {
    text("HEAD MEET BRICKS", width/2, height/2); // placeholder/title

    switch(mode) {
    case 0: 
      screenGrab();
      break;
    case 1: 
      isThisRight();
      break;
    case 2: 
      noiseGrab();
      break;
    case 3: 
      isSoundRight();
      break;
    case 4: 
      gameHeadBrick();
      break;
    case 5:
    }
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
    println("woop here we gooo");
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

  // void where the player decides if the picture is good
  void isThisRight() {
    image(ball, width/2, height/2);
    fill(255);
    text("is this picture ok? (y/n)", width/2, height-30);
  }

  // void where sound is recorded
  void noiseGrab() {
    background(0);

    text("press x to record, then x again to stop recording \n(if you dont know what to say, say OW!)", width/2, height/2);
  }

  //void to let the player decide if sound is good
  void isSoundRight() {
    background(0);
    text("is this sound right? (Y/N)\n(press x to listen)", width/2, height/2);


    recorder = minim.createRecorder(in, "file.wav");
  }

  // void for the game!
  void gameHeadBrick() {
    // display and update everything. Check collisions
    fill(255);
    text("Lives left: "+ lives, 60, height-15);

    headPaddle.display();
    headPaddle.update();
    headBall.display();
    headBall.update();
    headBall.collide(headPaddle);
    // go through both bricks arrays
    destroyedBricks = 0; // amount of destroyed bricks
    for (int i = 0; i < bricks.length; i++) {
      if (!bricks[i].destroyed) {
        bricks[i].display();
        bricks[i].update();
        bricks[i].collide(headBall);
      } else if (bricks[i].destroyed) {
        destroyedBricks++;
        // count destroyed bricks
      }
    }
    if (headBall.y >= height) {// if ball goes past boundaries, lose a life
      lives-=1;
    }
  }

  // if win:
  void win() {
  }

  void gameOver() {

    // if person lost:
  }

  void keyPressed() {
    switch(mode) {
    case 0: 
      if (key == 'x') {
        background(0);
        PImage p = video.get(170, 90, 300, 300);
        image(p, width/2, height/2);
        video.stop();
        save("frame.tif");
        ball = loadImage("frame.tif");
        mode = 1;
      }
      break;

    case 1:
      if (key == 'y') {
        mode = 2;
      } else if (key == 'n') {
        mode = 0;
        video.start();
      }
      break;

    case 2: 
      if (key == 'x') {
        if (!recorder.isRecording()) { // if its not recording already
          text("RECORDING", 100, 100);
          recorder.beginRecord(); // start recording
        } else {
          text("Recording stopped.", 100, 100); // if not, stop the recording
          recorder.endRecord();    
          if (player != null) { // if the player has something in it, put it into out, and close it
            player.unpatch(out);
            player.close();
          }

          player = new FilePlayer(recorder.save()); // new save thing
          player.patch(out); //put out in it
          mode = 3;
          println(3);
        }
      }
      break;

    case 3:
      if (key == 'y') {
        mode = 4;
      } else if (key == 'n') {
        mode = 2;
      } else if (key == 'x') {
        println("Playing.");
        player.play(); // play it
      }
      break;

    case 4:
      headPaddle.keyPressed();
      break;

    case 5:
      break;
    }
  }
}