float x;
int TEKI=5;//the number of "teki"
PImage[] teki=new PImage[TEKI];

void setup() {
  size(480, 720);
  colorMode(RGB);
  background(255, 255, 255);
  smooth();
}


//void draw(){
//  
//  fade();
//  rect(100,100,10,10);
//  rotate(PI/2);
//  for(int i=0;i<TEKI;i++){
//    teki[i]=loadImage("tekijet.bmp");
//    image(teki[i],100,x+i*70);
//    x=x-1.3;//speed
//  }
//  
//}


void draw() {

  fade();
  for (int i=0; i<TEKI; i++) {
    translate(x+i*70, 100);
    rotate(PI/2);
    teki[i]=loadImage("tekijet.bmp");
    image(teki[i], 0, 0);
    rotate(-PI/2);
    translate(-(x+i*70), -100);
    x+=1.3;//speed
  }
}

void fade() {
  fill(255, 255, 255);
  rect(0, 0, 480, 720);
}

