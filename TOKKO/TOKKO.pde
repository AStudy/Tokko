MyPlane myPlane;
ArrayList<MyMissile> myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;
ArrayList<EnemyMissile> enemyMissiles;

PImage jikiJet, tekiJet;

void setup() {
  size(720, 720);
  background(255);
  frameRate(30);
  
  jikiJet = loadImage("jikijet.bmp");
  tekiJet = loadImage("tekijet.bmp");
  
  myPlane = new MyPlane();
  myMissiles = new ArrayList<MyMissile>();
  enemies = new ArrayList<Enemy>();
  enemyMissiles = new ArrayList<EnemyMissile>();
  missileFlag = false;

  Enemy enemy =new Enemy(200, 100);
  enemies.add(enemy);
  enemy =new AimingEnemy(500, 100);
  enemies.add(enemy);
}

void draw() {   
  background(255);

  if(myPlane.isDead == true){return;}

  if(missileFlag){
    MyMissile myMissile = new MyMissile(myPlane.xPos, myPlane.yPos);
    myMissiles.add(myMissile);
  }
  myPlane.mydraw();
  
  for(Enemy enemy:enemies)
  {
    if(enemy.isDead == false){
      enemy.done(myPlane);
      enemy.draw();
      for(MyMissile myMissile:myMissiles){ myMissile.missileGo(enemy); }
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
