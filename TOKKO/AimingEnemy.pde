class AimingEnemy extends Enemy
{

  AimingEnemy(int _t, float _x, float _y, float _s, int _missileType, int _moveType, int _direction)
  {
    super(_t, _x, _y, _s, _missileType, _moveType, _direction);
  }
  
  void addMissile(MyPlane myPlane)
  {
    float d = dist(x, y, myPlane.xPos, myPlane.yPos);
    if (d == 0) return;
    
    float sX = (myPlane.xPos - x) / d * 5;
    float sY = (myPlane.yPos - y) / d * 5;
    
    EnemyMissile em = new EnemyMissile(x, y+h, sX, sY);
    enemyMissiles.add(em);
  }

}

