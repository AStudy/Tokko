class AimingEnemy extends Enemy
{

  AimingEnemy(String[] args)
  {
    super(args);
  }
  
  void addMissile(ArrayList<EnemyMissile> enemyMissiles, MyPlane myPlane)
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

