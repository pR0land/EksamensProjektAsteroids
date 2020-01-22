AstroideL[] astroides;

void setup(){
  size(800,800);
  astroides = new AstroideL[0];
  for(int i=0; i<3; i++){
  astroides = (AstroideL[])append(astroides, new AstroideL()); 
  }
}

void draw(){
  background(0);
  for(int i=0; i<astroides.length;i++){
    astroides[i].displayAstroide();
    astroides[i].astroideMove();
    astroides[i].asCheckEdges();
  }
}
