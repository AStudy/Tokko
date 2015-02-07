class Enemy
{
  public boolean check =false;
  int startTime;
  float x, y;
  float w = 50, h = 50;
  public boolean isDead = false;
  Controller controller;

  Enemy(int _t, Controller _controller)
  {
    startTime = _t;
    controller = _controller;
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

    float[] pos = this.controller.getPos();
    x = pos[0];
    y = pos[1];
    if (frameCount % 30 == 0)
    {
      addMissile(myPlane);
    }
  }
}

