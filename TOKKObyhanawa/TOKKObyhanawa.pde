Myplane my_plane;
ArrayList<Mymissile> myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;
ArrayList<EnemyMissile> enemyMissiles;

void setup() {
  size(720, 720);
  background(255);
  frameRate(30);
  my_plane = new Myplane();
  myMissiles = new ArrayList<Mymissile>();
  enemies = new ArrayList<Enemy>();
  enemyMissiles = new ArrayList<EnemyMissile>();
  missileFlag = false;

  Enemy enemy =new Enemy(200, 100); // changed
  enemies.add(enemy);
}

void draw() {  
  background(255);

  if(my_plane.isDead == true){return;}

  if(missileFlag){
    Mymissile mymissile = new Mymissile(my_plane.xPos, my_plane.yPos);
    myMissiles.add(mymissile);
  }
  my_plane.mydraw();
  
  for(Enemy enemy:enemies)
  {
    if(enemy.isDead == false){
      enemy.done();
      enemy.draw();
      for(Mymissile myMissile:myMissiles){ myMissile.missileGo(enemy); }
    }
  }
  
  for(EnemyMissile em:enemyMissiles){ em.missileGo(my_plane); }

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
        my_plane.upFlag = false;
    }
    if(keyCode == DOWN){
        my_plane.downFlag = false;
    }
    if(keyCode == RIGHT){
        my_plane.rightFlag = false;
    }
    if(keyCode == LEFT){
        my_plane.leftFlag = false;
    }
  }
}
