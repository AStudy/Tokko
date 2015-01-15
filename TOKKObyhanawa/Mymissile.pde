class Mymissile{
  float xPos, yPos;
  
  Mymissile(float _xPos, float _yPos){
    xPos = _xPos;
    yPos = _yPos;
  }
  
  void missileGo(){
    yPos = yPos - 5;
    ellipse(xPos, yPos, 5, 5);
    /*
    distance = dist(xPos, yPos, enemy.x, enemy.y); //dist between an enemy-plane and a missile
    if(distance < ???) enemy.dead();
    */
  }
}
