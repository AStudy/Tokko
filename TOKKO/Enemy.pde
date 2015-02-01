class Enemy
{
  public boolean check =false;
  int count = 0;
  int t;
  float x, y, s;
  float w = 50, h = 50;
  int type;
  int direction;
  public boolean isDead = false;

  Enemy(int _t, float _x, float _y, float _s,int _type, int _direction)
  {
    t = _t;
    x = _x;
    y = _y;
    s = _s;
    type = _type;
    direction = _direction;
  }

  void draw()
  {
    if (frameCount == t) check = true;
    if (check) {
      pushMatrix();
      translate(x, y);
      scale(1, -1);
      if (type == 1) { // yoko
        image(images.get("tekiJet1"), s*count, 0);
      }
      if (direction == 1) count++;
      if (direction == 3) count--;
      popMatrix();
    }
  } 
  void addMissile(MyPlane myPlane)
  {
    EnemyMissile em = new EnemyMissile(x+s*count, y+h);
    enemyMissiles.add(em);
  }

  void done(MyPlane myPlane)
  {
    //if(frame % 30 == 0)
    if (frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

