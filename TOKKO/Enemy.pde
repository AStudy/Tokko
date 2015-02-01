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
    pushMatrix();
    translate(x, y);
    scale(1, -1);
    image(images.get("tekijet"), 0, 0);  
    popMatrix();
  }
  
  void addMissile(MyPlane myPlane)
  {
    EnemyMissile em = new EnemyMissile(x, y+h);
    enemyMissiles.add(em);
  }
  
  void done(MyPlane myPlane)
  {
    //if(frame % 30 == 0)
    if(frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

