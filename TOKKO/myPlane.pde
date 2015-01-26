class MyPlane {
  public float xPos, yPos;
  int moveValue;
  public boolean upFlag, downFlag, rightFlag, leftFlag = false;
  public boolean isDead = false;
  
  MyPlane(){
    xPos = width/2.0;
    yPos = 7 * height/8.0;
    moveValue = 5;
  }

  void mydraw(){
    imageMode(CENTER);
    image(jikiJet, xPos, yPos);
    
    if(upFlag == true) yPos = max(yPos - moveValue, 0); //Go up
    if(downFlag == true) yPos = min(yPos + moveValue, height); //Go down
    if(rightFlag == true) xPos = min(xPos + moveValue, width); //go right
    if(leftFlag == true) xPos = max(xPos - moveValue, 0); //go left
    
    if(keyPressed && key == CODED){
      if(keyCode == UP){
        upFlag = true;
      }
      if(keyCode == DOWN){
        downFlag = true;
      }
      if(keyCode == RIGHT){
        rightFlag = true;
      }
      if(keyCode == LEFT){
        leftFlag = true;
      }
    }
  }
}

