class EnemyMissile{
  float pX, pY; //position
  float sX = 0, sY = 5; //speed
  
  EnemyMissile(float _pX, float _pY){
    pX = _pX;
    pY = _pY;
  }
  
  boolean missileGo(Myplane myPlane){
    pX += sX;
    pY += sY;
    ellipse(pX, pY, 5, 5);

    float distance = dist(pX, pY, myPlane.xPos, myPlane.yPos);
    if(distance < 10){ myPlane.isDead = true; }

    return true;
  }
}
