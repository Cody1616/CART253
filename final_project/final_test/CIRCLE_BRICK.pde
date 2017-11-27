class CircleBrick {

  Paddle[] circlePaddle;
  Ball circleBall;

  CircleBrick() {
  }
  
  void drawCircleBricks(){
    
    //pushing matrix to set the origin at the center of the window to move the paddles around
    pushMatrix();
    translate(width/2, height/2);
    text("CIRCLE BRICKS", 0, 0);
    popMatrix();
  
  
  
  
  }
  
  void keyPressed(){
  if (keyCode == LEFT) {
     
    }
    if (keyCode == RIGHT) {
      
    }
  
  }
}