PImage player;
int landX,landY;
float tranX=0,tranY=0;
int playerX=560,playerY=590;
int playerState;
final int PLAYER_IDLE=0,PLAYER_UP=1,PLAYER_DOWN=2,PLAYER_RIGHT=3,PLAYER_LEFT=4;
  int movingTimer=0;
void setup(){
  size(1280,720,P2D);
  noStroke();
  player = loadImage("img/player.png");
}


void draw(){
  pushMatrix();
  translate(tranX,tranY);
  tranX-=0.5;
  tranY+=1;
  for(int i=0;i<19;i++){
    for(int j=10;j>-300;j--){
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
  
  //drawPlayer
  switch(playerState){
    case PLAYER_IDLE:
      image(player,playerX,playerY);
      break;
    case PLAYER_UP:
      movingTimer+=1;
      playerX+=3;
      playerY-=6;
      image(player,playerX,playerY);
      break;
    case PLAYER_DOWN:
      movingTimer+=1;
      playerX-=3;
      playerY+=6;
      image(player,playerX,playerY);
      break;
    case PLAYER_LEFT:
      movingTimer+=1;
      playerX-=8;
      playerY-=2;
      image(player,playerX,playerY);
      break;
    case PLAYER_RIGHT:
      movingTimer+=1;
      playerX+=8;
      playerY+=2;
      image(player,playerX,playerY);
      break;
  }
  
  if(movingTimer==10){
    playerState=PLAYER_IDLE;
    movingTimer=0;
  }
      
  
  popMatrix();
}

void keyPressed(){
  // Add your moving input code here
      if(key ==CODED){
          switch(keyCode){
            case UP:
              if(playerState==PLAYER_IDLE){
                playerState=PLAYER_UP;
                movingTimer=0;
              }
              break;
            case RIGHT:
              if(playerState==PLAYER_IDLE){
                playerState=PLAYER_RIGHT;
                movingTimer=0;
              }
              break;
            case LEFT:
              if(playerState==PLAYER_IDLE){
                playerState=PLAYER_LEFT;
                movingTimer=0;
              }
              break;
            case DOWN:
              if(playerState==PLAYER_IDLE){
                playerState=PLAYER_DOWN;
                movingTimer=0;
              }
              break;
          }
        }
}
