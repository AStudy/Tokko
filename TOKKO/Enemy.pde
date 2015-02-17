class Enemy
{
  public boolean check =false;
  int startTime;
  float x, y;
  float w = 50, h = 50;
  public boolean isDead = false;
  Controller controller;

  Enemy(String[] args)
  {
    startTime = parseInt(args[0]);
    controller = createController(args);
  }

  void draw()
  {
    if (frameCount == startTime) check = true;
    if (check) {
      pushMatrix();
      translate(x, y);
      scale(1, -1);
      image(images.get("tekiSentouki.png"), 0, 0);
      popMatrix();
    }
  } 

  void addMissile(ArrayList<EnemyMissile> enemyMissiles, MyPlane myPlane)
  {
    EnemyMissile em = new EnemyMissile(x, y+h/2);
    enemyMissiles.add(em);
  }

  void done(ArrayList<EnemyMissile> enemyMissiles, MyPlane myPlane)
  {
    if (frameCount < this.startTime){ return; }

    float[] pos = this.controller.getPos();
    x = pos[0];
    y = pos[1];
    if (frameCount % 30 == 0)
    {
      addMissile(enemyMissiles, myPlane);
    }
    if(x > width || y > height) isDead = true;
  }
}

