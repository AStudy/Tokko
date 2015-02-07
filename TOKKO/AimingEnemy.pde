class AimingEnemy extends Enemy
{

  AimingEnemy(int _t, float _x, float _y, float _s, int _direction)
  {
    super(_t, _x, _y, _s, _direction);
  }
  
  void addMissile(MyPlane myPlane)
  {
    float mX = x;
    float mY = y+h;
    
    float d = dist(mX, mY, myPlane.xPos, myPlane.yPos);
    if (d == 0) return;
    
    float sX = (myPlane.xPos - mX) / d * 5;
    float sY = (myPlane.yPos - mY) / d * 5;
    
    EnemyMissile em = new EnemyMissile(mX, mY, sX, sY);
    enemyMissiles.add(em);
  }

}

