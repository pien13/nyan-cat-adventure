class Grass extends Map {
  Tree[] trees;
  Grass(int y) {
    super(y);
    
  }
  void display() {
    for (int i=0; i<19; i++) {
      if (i<6 || i>14) {
        fill(#0cb43c);
      } else {
        fill(#0ed145);
      }
      landX=i*80+y*(-30);
      landY=i*20+y*60;
      quad(landX, landY-5, landX+80, landY+20-5, landX+50, landY+80-5, landX-30, landY+60-5);
      if (i<6 || i>14) {
        fill(#0a9030);
      } else {
        fill(#0cb43c);
      }
      quad(landX+50, landY+80-5, landX-30, landY+60-5, landX-30, landY+60, landX+50, landY+80);
    }
  }
}
