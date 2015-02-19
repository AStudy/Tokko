class Stage
{
  MyPlane myPlane;
  ArrayList<MyBullet> myBullets;
  boolean bulletFlag;
  ArrayList<Enemy> enemies;
  ArrayList<EnemyBullet> enemyBullets;
  
  Stage(String settingPath)
  {
    myPlane = new MyPlane();
    myBullets = new ArrayList<MyBullet>();
    enemies = new ArrayList<Enemy>();
    enemyBullets = new ArrayList<EnemyBullet>();
    bulletFlag = false;
    createEnemies(loadStrings(settingPath));
  }
  
  void draw()
  {
    background(255);
    if (myPlane.isDead == true) {
      return;
    }

    if (bulletFlag) {
      MyBullet myBullet = new MyBullet(myPlane.xPos, myPlane.yPos);
      myBullets.add(myBullet);
    }
    myPlane.mydraw();

    for (Enemy enemy : enemies)
    {
      if (enemy.isDead == false) {
        enemy.done(enemyBullets, myPlane);
        enemy.draw();
      }
    }

    for (MyBullet mb : myBullets) { 
      mb.bulletGo(enemies);
    }

    for (EnemyBullet eb : enemyBullets) { 
      eb.bulletGo(myPlane);
    }
  }
  
  void keyPressed()
  {
    if (key == ' ') {
      bulletFlag = true;
    }
  }
  
  void keyReleased() {
    if (key == ' ') {
      bulletFlag = false;
    }
    if (key == CODED) {
      if (keyCode == UP) {
        myPlane.upFlag = false;
      }
      if (keyCode == DOWN) {
        myPlane.downFlag = false;
      }
      if (keyCode == RIGHT) {
        myPlane.rightFlag = false;
      }
      if (keyCode == LEFT) {
        myPlane.leftFlag = false;
      }
    }
  }
  
  void createEnemies(String lines[]) {
    for(String line: lines)
    {
      String [] chars = split(line, ',');
      String enemyType = chars[1];

      if (enemyType.equals("Normal")) 
      {
        Enemy enemy = new Enemy(chars);
        enemies.add(enemy);
      }
      else if (enemyType.equals("Aiming"))
      {
        AimingEnemy enemy = new AimingEnemy(chars);
        enemies.add(enemy);
      }
    }
  }
}
