float x;
int TEKI=8;//the number of "teki"
float HABA=PI/25;
PImage[] teki=new PImage[TEKI];

void setup(){
  size(480,720);
  colorMode(RGB);
  background(255,255,255);
  smooth();
}


void draw(){
  
  fade();
  rotate(PI);
  for(int i=0;i<TEKI;i++){
    teki[i]=loadImage("tekijet.bmp");
    image(teki[i],-(width-100)*cos(x-HABA*i),-(width-100)*sin(x-HABA*i));
   
    x=x+PI/3000;//speed
  }

}


void fade(){
  fill(255,255,255);
  rect(0,0,480,720);
}
