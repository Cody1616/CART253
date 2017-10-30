import processing.video.*;
Capture video;
void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
}
void draw() {
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  for (int i = 0; i < video.pixels.length; i++) {
   video.pixels[i] += random(800,60);
  }
  video.updatePixels(); // If we changed the pixels array we need to update it
  image(video, 0, 0);
  
}