class Enemy
{
  float x, y;
  float w = 50, h = 50;
  public boolean isDead = false;

  Enemy(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  void draw()
  {
    rectMode(CENTER);
    rect(x, y, w, h);  
  }
  
  void done()
  {
    //if(frame % 30 == 0)
    if(frameCount % 30 == 0)
    {
      EnemyMissile em = new EnemyMissile(x, y+h);
      enemyMissiles.add(em);
    }
  }
}

