Myplane my_plane;
ArrayList myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;

void setup() {
  size(720, 720);
  background(255);
  frameRate(30);
  my_plane = new Myplane();
  myMissiles = new ArrayList();
  enemies = new ArrayList<Enemy>();
  missileFlag = false;

  Enemy enemy = new Enemy(200, 100);
  enemies.add(enemy);
}

void draw() {  
  background(255);
  if(missileFlag){
    Mymissile mymissile = new Mymissile(my_plane.xPos, my_plane.yPos);
    myMissiles.add(mymissile);
  }
  for(int i = myMissiles.size() - 1; i >= 0; i--){
    Mymissile m = (Mymissile) myMissiles.get(i);
    m.missileGo();
    if( m.yPos < 0 ){
      myMissiles.remove(i);
    }
  }
  my_plane.mydraw();
  
  for(Enemy enemy:enemies)
  {
    enemy.done();
    enemy.draw();
  }
  
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
