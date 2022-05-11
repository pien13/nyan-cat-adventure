PImage player;
int landX, landY;
float tranX=0, tranY=0;
int playerX=560, playerY=590;
int offsetX=0, offsetY=0;
int playerState;
final int PLAYER_IDLE=0, PLAYER_UP=1, PLAYER_DOWN=2, PLAYER_RIGHT=3, PLAYER_LEFT=4;
int movingTimer=0;
Map[] maps=new Map[40];
final int ROAD=1, GRASS=0;


void setup() {
  size(1280, 720, P2D);
  noStroke();
  player = loadImage("img/player.png");
  
  for (int i=0; i<maps.length; i++) {
    if (i<16) {
      maps[i]=new Grass(20-i);
    } else {
      switch(floor(random(2))){
          case 0:maps[i]=new Grass(20-i);break;
          case 1:maps[i]=new Road(20-i);break;
      }
    }
  }
}


void draw() {
  pushMatrix();
  //Adjust Rolling Speed
  for (int i=550; i>=0; i=i-25) {
    if (tranY+playerY<=i) {
      tranX-=0.125;
      tranY+=0.25;
    }
  }
  tranX-=0.125;
  tranY+=0.25;
  translate(tranX, tranY);


  //draw map

  for (int j=39; j>=0; j--) {
    maps[j].display();
  }
  for (int j=39; j>0; j--) {
    roadMarkingLine(j);
  }

  //drawPlayer
  switch(playerState) {
  case PLAYER_IDLE:
    image(player, playerX, playerY);
    break;
  case PLAYER_UP:
    movingTimer+=1;
    playerX+=3;
    playerY-=6;
    image(player, playerX, playerY-5);
    break;
  case PLAYER_DOWN:
    movingTimer+=1;
    playerX-=3;
    playerY+=6;
    image(player, playerX, playerY-5);
    break;
  case PLAYER_LEFT:
    movingTimer+=1;
    playerX-=8;
    playerY-=2;
    image(player, playerX, playerY-5);
    break;
  case PLAYER_RIGHT:
    movingTimer+=1;
    playerX+=8;
    playerY+=2;
    image(player, playerX, playerY-5);
    break;
  }

  if (movingTimer==10) {
    playerState=PLAYER_IDLE;
    movingTimer=0;
  }



  popMatrix();
}

void keyPressed() {
  // Add your moving input code here
  if (key ==CODED) {
    switch(keyCode) {
    case UP:
      if (playerState==PLAYER_IDLE) {
        playerState=PLAYER_UP;
        movingTimer=0;
        offsetY++;
        //offset map forward and create new map
        for (int i=0; i<39; i++) {
          maps[i]=maps[i+1];
        }
        switch(floor(random(2))){
          case 0:maps[39]=new Grass(20-offsetY-39);break;
          case 1:maps[39]=new Road(20-offsetY-39);break;
        }
        
      }
      break;
    case RIGHT:
      if (playerState==PLAYER_IDLE&&offsetX<4) {
        playerState=PLAYER_RIGHT;
        movingTimer=0;
        offsetX++;
      }
      break;
    case LEFT:
      if (playerState==PLAYER_IDLE&&offsetX>-4) {
        playerState=PLAYER_LEFT;
        movingTimer=0;
        offsetX--;
      }
      break;
    case DOWN:
      if (playerState==PLAYER_IDLE) {
        playerState=PLAYER_DOWN;
        movingTimer=0;
        offsetY--;
        
        //offset map backward and create new map
        for (int i=39; i>0; i--) {
          maps[i]=maps[i-1];
        }
      }
      break;
    }
  }
}
