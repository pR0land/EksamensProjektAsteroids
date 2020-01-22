class AstroideM extends AstroideL{
  AstroideM(){
    this.size = 75;
    this.speed =3;
    this.direct = PVector.fromAngle(random(-90,90),deadAstroideDirect);
  }
  void dead(){
   deadAstroideDirect = new PVector(this.pos.x,this.pos.y);
   for(int i=0; i<2;i++){
    astroidesS = (AstroideS[])append(astroidesS, new AstroideS());  
   }
  }
}
