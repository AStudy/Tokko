class Stage
{
  MyPlane myPlane;
  ArrayList<MyMissile> myMissiles;
  boolean missileFlag;
  ArrayList<Enemy> enemies;
  ArrayList<EnemyMissile> enemyMissiles;
  
  Stage(String settingPath)
  {
    myPlane = new MyPlane();
    myMissiles = new ArrayList<MyMissile>();
    enemies = new ArrayList<Enemy>();
    enemyMissiles = new ArrayList<EnemyMissile>();
    missileFlag = false;
    createEnemies(loadStrings(settingPath));
  }
  
  void draw()
  {
    background(255);
    if (myPlane.isDead == true) {
      return;
    }

    if (missileFlag) {
      MyMissile myMissile = new MyMissile(myPlane.xPos, myPlane.yPos);
      myMissiles.add(myMissile);
    }
    myPlane.mydraw();

    for (Enemy enemy : enemies)
    {
      if (enemy.isDead == false) {
        enemy.done(enemyMissiles, myPlane);
        enemy.draw();
      }
    }

    for (MyMissile mm : myMissiles) { 
      mm.missileGo(enemies);
    }

    for (EnemyMissile em : enemyMissiles) { 
      em.missileGo(myPlane);
    }
  }
  
  void keyPressed()
  {
    if (key == ' ') {
      missileFlag = true;
    }
  }
  
  void keyReleased() {
    if (key == ' ') {
      missileFlag = false;
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
    for (int i=0; i < lines.length; i++) 
    {
      String [] chars=split(lines[i], ',');
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
