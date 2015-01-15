class EnemyMissile{
  float xPos, yPos;
  
  EnemyMissile(float _xPos, float _yPos){
    xPos = _xPos;
    yPos = _yPos;
  }
  
  boolean missileGo()
  {
    yPos = yPos + 5;
    ellipse(xPos, yPos, 5, 5);

    return true;
  }
}
