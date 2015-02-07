class Enemy
{
  public boolean check =false;
  int count = 0;
  int startTime;
  float x, y, s;
  float w = 50, h = 50;
  int moveType;
  int direction;
  public boolean isDead = false;

  Enemy(int _t, float _x, float _y, float _s, int _moveType, int _direction)
  {
    startTime = _t;
    x = _x;
    y = _y;
    s = _s;
    moveType = _moveType;
    direction = _direction;
  }

  void draw()
  {
    if (frameCount == startTime) check = true;
    if (check) {
      pushMatrix();
      translate(x, y);
      scale(1, -1);
      if (moveType == 1) { // yoko
        image(images.get("tekijet.png"), s*count, 0);
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
    if (frameCount < this.startTime){ return; }

    if (frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

