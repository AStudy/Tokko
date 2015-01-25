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
    imageMode(CENTER);
    pushMatrix();
    translate(x, y);
    scale(1, -1);
    image(tekiJet, 0, 0);  
    popMatrix();
  }
  
  void addMissile(Myplane myPlane)
  {
    EnemyMissile em = new EnemyMissile(x, y+h);
    enemyMissiles.add(em);
  }
  
  void done(Myplane myPlane)
  {
    //if(frame % 30 == 0)
    if(frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

