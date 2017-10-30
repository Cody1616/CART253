float x = 0;

void setup() {
  size(600, 600);
  fill(255);
}
void draw() {
  float y = 127 + (sin(x) * 127); // several sine functions to offset the colors and 
  float z = 127 + (sin(x + 30) * 127); // create a looping rainbow gradient effect
  float w = 127 + (sin(x + 60) * 127);
  background(int(y), int(z), int(w)); 
  x += 0.05; 
}