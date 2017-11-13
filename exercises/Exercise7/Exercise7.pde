import processing.sound.*;  // import libraries
import processing.video.*;

// self explanatry - capture the video
Capture video;

// theremin photo
PImage theremin;

// vectors for the antennas
PVector freqAntenna;
PVector ampAntenna;
  float ampDist;
  float freqDist;

// sine wave
SinOsc sine;

// "paddles" for volume and amp control
Controller freq;
Controller amp;
void setup() {
  size(640, 480);
  
  //load theremin image
  theremin = loadImage("theremin2.png");

  // Create the sine oscillator.
  sine = new SinOsc(this);
  // Start it
  sine.play();
  
  // Start capturing video
  video = new Capture(this, 640, 480, 30);
  video.start();
  
  // Set up paddles
  amp = new Controller(255, 0, color(255, 0, 0));
  freq = new Controller(0, 255, color(0, 0, 255));
  
  // Set up vectors where the theramin handles are
  
  ampAntenna =new PVector(347, 430);
  freqAntenna =new PVector(606, 247);
}
void draw() {
  // function to check if video is available, and read it
  handleVideoInput();
  // place video image
  image(video, 0, 0);
  //place theramin image
  image(theremin, width/2, height/2);
  amp.display();
  amp.update();
  freq.display();
  freq.update();
  println(mouseX, mouseY);
  
  ampDist = dist(amp.pixelX, amp.pixelY, ampAntenna.x, ampAntenna.y);

  // Map the mouse x to control the frequency
  sine.freq(map(mouseX, 0, width, 110, 880));
  // Map the mouse y to control the amplitude
  sine.amp(map(ampDist, 0, 200, 1, 0));
}


void handleVideoInput() {
  // is the video available?
  if (!video.available()) {
    // If not, return.
    return;
  }

  // if not, read video
  video.read();
}