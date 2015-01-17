class Enemy
{
  float x, y;
  float w = 50, h = 50;
  //int frame = 0;
  public boolean isDead = false; //added

  Enemy(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  void draw()
  {
    rectMode(CENTER); //added
    rect(x, y, w, h);  
  }
  
  void done()
  {
    //if(frame % 30 == 0)
    if(frameCount % 30 == 0)
    {
      EnemyMissile em = new EnemyMissile(x, y+h); //changed
      enemyMissiles.add(em);
    }
      
    //frame++;
  }
}

