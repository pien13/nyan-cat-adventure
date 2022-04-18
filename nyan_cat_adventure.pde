PImage player;
int landX,landY;
float tranX=0,tranY=0;
int playerX=560,playerY=590;
int offsetX=0,offsetY=0;
int playerState;
final int PLAYER_IDLE=0,PLAYER_UP=1,PLAYER_DOWN=2,PLAYER_RIGHT=3,PLAYER_LEFT=4;
int movingTimer=0;
  
//map drawing functions
//grass
void grass(int j){
  for(int i=0;i<19;i++){
    if(i<6 || i>14){
      fill(#0cb43c);
    }else{
      fill(#0ed145);
    }
    landX=i*80+j*(-30);
    landY=i*20+j*60;
    quad(landX,landY-5,landX+80,landY+20-5,landX+50,landY+80-5,landX-30,landY+60-5);
    
    if(i<6 || i>14){
      fill(#0a9030);
    }else{
      fill(#0cb43c);
    }
    quad(landX+50,landY+80-5,landX-30,landY+60-5,landX-30,landY+60,landX+50,landY+80);
  }
    
}

void road(int j){
  for(int i=0;i<19;i++){
    fill(#404040);
    landX=i*80+j*(-30);
    landY=i*20+j*60;
    quad(landX,landY,landX+80,landY+20,landX+50,landY+80,landX-30,landY+60);
    
    fill(100);
    //draw line
    if(i%2==0){
      quad(landX-14,landY+28,landX+66,landY+48,landX+64,landY+52,landX-14,landY+32);
    }
  }
}
void setup(){
  size(1280,720,P2D);
  noStroke();
  player = loadImage("img/player.png");
}


void draw(){
  pushMatrix();
  translate(tranX,tranY);
  tranX-=0.125;
  tranY+=0.25;
  
  //draw map
  
  for(int j=20-offsetY;j>-20-offsetY;j--){
    if(j%2==0){
      grass(j);
    }else{
      road(j);
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
      image(player,playerX,playerY-10);
      break;
    case PLAYER_DOWN:
      movingTimer+=1;
      playerX-=3;
      playerY+=6;
      image(player,playerX,playerY-10);
      break;
    case PLAYER_LEFT:
      movingTimer+=1;
      playerX-=8;
      playerY-=2;
      image(player,playerX,playerY-10);
      break;
    case PLAYER_RIGHT:
      movingTimer+=1;
      playerX+=8;
      playerY+=2;
      image(player,playerX,playerY-10);
      break;
  }
  
  if(movingTimer==10){
    playerState=PLAYER_IDLE;
    movingTimer=0;
  }
  
  //Adjust Rolling Speed
  for(int i=550;i>=0;i=i-25){
    if(tranY+playerY<=i){
      tranX-=0.125;
      tranY+=0.25;
    }
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
                offsetY++;
              }
              break;
            case RIGHT:
              if(playerState==PLAYER_IDLE&&offsetX<4){
                playerState=PLAYER_RIGHT;
                movingTimer=0;
                offsetX++;
              }
              break;
            case LEFT:
              if(playerState==PLAYER_IDLE&&offsetX>-4){
                playerState=PLAYER_LEFT;
                movingTimer=0;
                offsetX--;
              }
              break;
            case DOWN:
              if(playerState==PLAYER_IDLE){
                playerState=PLAYER_DOWN;
                movingTimer=0;
                offsetY--;
              }
              break;
          }
        }
}
