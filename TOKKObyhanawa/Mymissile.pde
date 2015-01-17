class Mymissile{
  float xPos, yPos;
  
  Mymissile(float _xPos, float _yPos){
    xPos = _xPos;
    yPos = _yPos;
  }
  
  boolean missileGo(Enemy e){
    yPos = yPos - 5;
    ellipse(xPos, yPos, 5, 5);
    float distance = dist(xPos, yPos, e.x, e.y); //dist between an enemy-plane and a missile //added
    if(distance < 25){ e.isDead = true; } //added
    
    return true;
  }
}
