HashMap<String, PImage> images = new HashMap<String, PImage>();

MyPlane myPlane;
ArrayList<MyMissile> myMissiles;
boolean missileFlag;
ArrayList<Enemy> enemies;
ArrayList<EnemyMissile> enemyMissiles;
int gameCount=1;

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
  createEnemies(loadStrings("tokkoData.csv"));
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

void createEnemies(String lines[]) {
  //String lines[] = loadStrings("tokkoData.csv");
  String [][] csv;
  int csvWidth=0;

  for (int i=0; i < lines.length; i++) 
  {
    String [] chars=split(lines[i], ',');
    int _t = Integer.valueOf(chars[0]).intValue();
    String enemyType = chars[1];
    String controllerType = chars[2];
    float _x = Float.valueOf(chars[3]).floatValue();
    float _y = Float.valueOf(chars[4]).floatValue();
    float _s = Float.valueOf(chars[5]).floatValue();
    int _direction = Integer.valueOf(chars[6]).intValue();

    Controller ctrl = new HorizontalController(_x, _y, _s, _direction);

    if (enemyType.equals("Normal")) 
    {
      Enemy enemy = new Enemy(_t, ctrl);
      enemies.add(enemy);
    }
    else if (enemyType.equals("Aiming"))
    {
      AimingEnemy enemy = new AimingEnemy(_t, ctrl);
      enemies.add(enemy);
    }
  }
}

void createImages()
{
  String lines[] = loadStrings("plane.csv"); 
  int csvWidth=0;
  String [][] csv;
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
  for (int i = 0; i < lines.length; i++) {
    images.put(csv[i][0], loadImage(csv[i][0]));
  }
}

void resetGame() {
  if (frameCount == 900) {
    gameCount ++;
    frameCount = 0;
    for (Enemy enemy : enemies)
    {
      enemy.check = false;
      enemy.isDead = false;
    }
    myPlane.isDead = false;
    myPlane.xPos = width/2.0;
    myPlane.yPos = 7 * height/8.0;
    switch (gameCount % 2)
    {
    case 0:
      enemies = new ArrayList<Enemy>();
      createEnemies(loadStrings("tokkoData2.csv"));
      break;

    default:
      enemies = new ArrayList<Enemy>();
      createEnemies(loadStrings("tokkoData.csv"));
      break;
    }
  }
}

