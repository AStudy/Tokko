class AimingEnemy extends Enemy
{

  AimingEnemy(String[] args)
  {
    super(args);
  }
  
  void addBullet(ArrayList<EnemyBullet> enemyBullets, MyPlane myPlane)
  {
    float mX = x;
    float mY = y+h;
    
    float d = dist(mX, mY, myPlane.xPos, myPlane.yPos);
    if (d == 0) return;
    
    float sX = (myPlane.xPos - mX) / d * 5;
    float sY = (myPlane.yPos - mY) / d * 5;
    
    EnemyBullet eb = new EnemyBullet(mX, mY, sX, sY);
    enemyBullets.add(eb);
  }

}

