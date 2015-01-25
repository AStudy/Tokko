class AimingEnemy extends Enemy
{

  AimingEnemy(float _x, float _y)
  {
    super(_x, _y);
  }
  
  void addMissile(Myplane myPlane)
  {
    float d = dist(x, y, myPlane.xPos, myPlane.yPos);
    if (d == 0) return;
    
    float sX = (myPlane.xPos - x) / d * 5;
    float sY = (myPlane.yPos - y) / d * 5;
    
    EnemyMissile em = new EnemyMissile(x, y+h, sX, sY);
    enemyMissiles.add(em);
  }

}

