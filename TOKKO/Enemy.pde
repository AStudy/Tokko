class Enemy
{
  public boolean check =false;
  int startTime;
  float x, y, s;
  float w = 50, h = 50;
  int direction;
  public boolean isDead = false;

  Enemy(int _t, float _x, float _y, float _s, int _direction)
  {
    startTime = _t;
    x = _x;
    y = _y;
    s = _s;
    direction = _direction;
    if (direction == 3){ s *= -1;}
  }

  void draw()
  {
    if (frameCount == startTime) check = true;
    if (check) {
      pushMatrix();
      translate(x, y);
      scale(1, -1);
      image(images.get("tekijet.png"), 0, 0);
      popMatrix();
    }
  } 

  void addMissile(MyPlane myPlane)
  {
    EnemyMissile em = new EnemyMissile(x, y+h/2);
    enemyMissiles.add(em);
  }

  void done(MyPlane myPlane)
  {
    if (frameCount < this.startTime){ return; }

    this.x += this.s;
    if (frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

