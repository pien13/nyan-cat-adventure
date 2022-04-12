int landX,landY;
int tranX=0,tranY=0;
void setup(){
  size(1280,720,P2D);
  noStroke();
}


void draw(){
  pushMatrix();
  translate(tranX,tranY);
  tranX+=3;
  tranY-=6;
  for(int i=0;i<19;i++){
    for(int j=-10;j<300;j++){
      if((i+j)%2==0){
        fill(#1e9600);
      }else{
        fill(#0ed145);
      }
      landX=i*80+j*(-30);
      landY=i*20+j*60;
      quad(landX,landY,landX+80,landY+20,landX+50,landY+80,landX-30,landY+60);
    }
  }
  
  popMatrix();
}
