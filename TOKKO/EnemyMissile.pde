class EnemyMissile{
  float xPos, yPos;
  
  EnemyMissile(float _xPos, float _yPos){
    xPos = _xPos;
    yPos = _yPos;
  }
  
  boolean missileGo(Myplane myPlane){
    yPos = yPos + 5;
    ellipse(xPos, yPos, 5, 5);

    float distance = dist(xPos, yPos, myPlane.xPos, myPlane.yPos);
    if(distance < 10){ myPlane.isDead = true; }

    return true;
  }
}
