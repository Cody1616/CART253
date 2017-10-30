void setup(){
size(600, 600);
}


void draw()
{
drawCircle(width/2, height/2, 100);
}



void drawCircle(int x, int y, float radius) {

 ellipse(mouseX, mouseY, radius, radius);

 if (radius > 2) {

  radius *= 0.75;

  drawCircle(mouseX, mouseY, radius);

 }

}