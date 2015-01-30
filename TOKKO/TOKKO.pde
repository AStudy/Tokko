HashMap<String, PImage> images = new HashMap<String, PImage>();

MyPlane myPlane;
ArrayList<MyMissile> myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;
ArrayList<EnemyMissile> enemyMissiles;

void setup() {  
  size(720, 720);
  background(255);
  frameRate(30);
  imageMode(CENTER);
  
  int csvWidth=0;
  String [][] csv;
  String lines[] = loadStrings("plane.csv");
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }
  csv = new String [lines.length][csvWidth];
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
  
  images.put("jikiJet", loadImage(csv[0][0]));
  images.put("tekiJet", loadImage(csv[1][0]));
  
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
    }
  }

  for(MyMissile mm : myMissiles){ mm.missileGo(enemies); }
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
