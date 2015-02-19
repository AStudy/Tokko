HashMap<String, PImage> images = new HashMap<String, PImage>();
int gameCount=0;
Stage stage;
String[] stages = {};

void setup() {  
  size(720, 720);
  background(255);
  frameRate(30);
  imageMode(CENTER);

  createImages();
  createStages();
  stage = new Stage(stages[0]);
}

void draw() {  
  resetGame();
  stage.draw();
}

void keyPressed() {
  stage.keyPressed();
}


void keyReleased() {
  stage.keyReleased();
}

void createImages()
{
  String lines[] = loadStrings("plane.csv"); 
  for (String line : lines) {
    images.put(line, loadImage(line));
  }
}

void createStages()
{
  String lines[] = loadStrings("stage.csv");
  for (String line : lines)
  {
    stages = (String[])append(stages, line);
  }
}
  
void resetGame() {
  if (frameCount == 300) {
    gameCount ++;
    frameCount = 0;
    stage = new Stage(stages[gameCount % stages.length]);
  }
}

