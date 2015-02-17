HashMap<String, PImage> images = new HashMap<String, PImage>();
int gameCount=1;
Stage stage;

void setup() {  
  size(720, 720);
  background(255);
  frameRate(30);
  imageMode(CENTER);

  createImages();
  stage = new Stage("stage3.csv");
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
  for(String line: lines){
    images.put(line, loadImage(line));
  }
}

void resetGame() {
  if (frameCount == 900) {
    gameCount ++;
    frameCount = 0;
    switch (gameCount % 2)
    {
    case 0:
      stage = new Stage("tokkoData2.csv");
      break;
    default:
      stage = new Stage("tokkoData.csv");
      break;
    }
  }
}

