Myplane myPlane;
ArrayList<Mymissile> myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;
ArrayList<EnemyMissile> enemyMissiles;

void setup() {
  size(720, 720);
  background(255);
  frameRate(30);
  myPlane = new Myplane();
  myMissiles = new ArrayList<Mymissile>();
  enemies = new ArrayList<Enemy>();
  enemyMissiles = new ArrayList<EnemyMissile>();
  missileFlag = false;

  Enemy enemy =new Enemy(200, 100); // changed
  enemies.add(enemy);
}

void draw() {  
  background(255);

  if(myPlane.isDead == true){return;}

  if(missileFlag){
    Mymissile mymissile = new Mymissile(myPlane.xPos, myPlane.yPos);
    myMissiles.add(mymissile);
  }
  myPlane.mydraw();
  
  for(Enemy enemy:enemies)
  {
    if(enemy.isDead == false){
      enemy.done();
      enemy.draw();
      for(Mymissile myMissile:myMissiles){ myMissile.missileGo(enemy); }
    }
  }
  
  for(EnemyMissile em:enemyMissiles){ em.missileGo(myPlane); }

}

void keyPressed(){
  if(key == ' '){
    missileFlag = true;
  }
}

void keyReleased(){
  if(key == ' '){
    missileFlag = false;
  }
  if(key == CODED){
    if(keyCode == UP){
        myPlane.upFlag = false;
    }
    if(keyCode == DOWN){
        myPlane.downFlag = false;
    }
    if(keyCode == RIGHT){
        myPlane.rightFlag = false;
    }
    if(keyCode == LEFT){
        myPlane.leftFlag = false;
    }
  }
}
