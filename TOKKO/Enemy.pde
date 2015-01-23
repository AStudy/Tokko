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

