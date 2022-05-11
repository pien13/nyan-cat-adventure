void roadMarkingLine(int y) {
  if (maps[y].type==ROAD && maps[y-1].type==ROAD) {
    for (int i=0; i<19; i++) {
      landX=i*80+maps[y].y*(-30);
      landY=i*20+maps[y].y*60;
      //quad(landX, landY, landX+80, landY+20, landX+50, landY+80, landX-30, landY+60);
      fill(100);
      //draw line
      if (i%2==0) {
        quad(landX-29, landY+58, landX+51, landY+78, landX+49, landY+82, landX-31, landY+62);
      }
    }
  }
}
