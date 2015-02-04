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
  createImages();
  myPlane = new MyPlane();
  myMissiles = new ArrayList<MyMissile>();
  enemies = new ArrayList<Enemy>();
  enemyMissiles = new ArrayList<EnemyMissile>();
  missileFlag = false;
<<<<<<< HEAD
  createEnemies(loadStrings("tokkoData.csv"));
=======
  createEnemies();
>>>>>>> 6a48580f896472372601f4f032bd1e51fbe4fad4
}

void draw() {  
  background(255);
  resetGame();
  println();

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
      enemy.done(myPlane);
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

void keyPressed() {
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

<<<<<<< HEAD
void createEnemies(String lines[]) {
  //String lines[] = loadStrings("tokkoData.csv");
=======
void createEnemies() {
  String lines[] = loadStrings("tokkoData.csv");
>>>>>>> 6a48580f896472372601f4f032bd1e51fbe4fad4
  String [][] csv;
  int csvWidth=0;

  for (int i=0; i < lines.length; i++) 
  {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }
  csv = new String [lines.length][csvWidth];
  for (int i=0; i < lines.length; i++)
  {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }

  for (int i = 0; i < lines.length; i++) {
    int _t = Integer.valueOf(csv[i][0]).intValue();
    float _x = Float.valueOf(csv[i][1]).floatValue();
    float _y = Float.valueOf(csv[i][2]).floatValue();
    float _s = Float.valueOf(csv[i][3]).floatValue();
    int _missileType = Integer.valueOf(csv[i][4]).intValue();
    int _moveType = Integer.valueOf(csv[i][5]).intValue();
    int _direction = Integer.valueOf(csv[i][6]).intValue();

    if (_missileType == 0) 
    {
      Enemy enemy = new Enemy(_t, _x, _y, _s, _missileType, _moveType, _direction);
      enemies.add(enemy);
    }

    if (_missileType == 1)
    {
      AimingEnemy enemy = new AimingEnemy(_t, _x, _y, _s, _missileType, _moveType, _direction);
      enemies.add(enemy);
    }
  }
}

void createImages()
{
  String Plines[] = loadStrings("plane.csv"); 
  int PcsvWidth=0;
  String [][] Pcsv;
  for (int i=0; i < Plines.length; i++) {
    String [] Pchars=split(Plines[i], ',');
    if (Pchars.length>PcsvWidth) {
      PcsvWidth=Pchars.length;
    }
  }
  Pcsv = new String [Plines.length][PcsvWidth];
  for (int i=0; i < Plines.length; i++) {
    String [] Ptemp = new String [Plines.length];
    Ptemp= split(Plines[i], ',');
    for (int j=0; j < Ptemp.length; j++) {
      Pcsv[i][j]=Ptemp[j];
    }
  }
  for (int i = 0; i < Plines.length; i++) {
    images.put(Pcsv[i][0], loadImage(Pcsv[i][0]));
  }
}

void resetGame() {
  if (frameCount == 900) {
    frameCount = 0;
    for (Enemy enemy : enemies)
    {
      enemy.check = false;
      enemy.count = 0;
      enemy.isDead = false;
    }
    myPlane.isDead = false;
    myPlane.xPos = width/2.0;
    myPlane.yPos = 7 * height/8.0;
    createEnemies(loadStrings("tokkoData2.csv"));
  }
}

