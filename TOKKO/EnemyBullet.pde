class EnemyBullet {
  boolean check = true;
  ;
  float pX, pY; //position
  float sX = 0, sY = 5; //speed

  EnemyBullet(float _pX, float _pY) {
    pX = _pX;
    pY = _pY;
  }

  EnemyBullet(float _pX, float _pY, float _sX, float _sY) {
    pX = _pX;
    pY = _pY;
    sX = _sX;
    sY = _sY;
  }

  void bulletGo(MyPlane myPlane) {
    pX += sX;
    pY += sY;
    ellipse(pX, pY, 5, 5);
    float distance = dist(pX, pY, myPlane.xPos, myPlane.yPos);
    if (distance < 10) { 
      myPlane.isDead = true;
    }
  }
}

