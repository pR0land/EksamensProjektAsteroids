class AstroideM extends AstroideL{
  AstroideM(){
    this.size = 75;
    this.speed =3;
    this.direct = PVector.fromAngle(random(-90,90),deadAstroideDirect);
    this.pos = deadAsPos;
  }
  void dead(){
   deadAstroideDirect = new PVector(this.direct.x,this.direct.y);
   deadAsPos = new PVector(this.pos.x,this.pos.y);
   for(int i=0; i<2;i++){
    astroidesS.add(new AstroideS());  
   }
  }
}
