float x=0;
int HABA=15;
int TEKI=8;//the number of "teki"
PImage[][] teki=new PImage[TEKI][TEKI];

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
    for(int j=0;j<=i;j++){
        teki[i][j]=loadImage("tekijet.bmp");
        if(i%2==1){
          image(teki[i][j],-(width/2+HABA*(2*j-i)),-(x-i*HABA*2));
        }
        else{
          image(teki[i][j],-(width/2+2*HABA*(j-i/2)),-(x-i*HABA*2));
        }
        
        x=x+0.3;//speed
    }
  }
  
}


void fade(){
  fill(255,255,255);
  rect(0,0,480,720);
}
