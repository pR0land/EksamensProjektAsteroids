class AstroideM extends AstroideL{
  AstroideM(PVector oldDirect,PVector oldPos){
    this.size = 75;
    this.speed =3;
    direct = oldDirect;
    direct.setMag(this.speed);
        println(this.direct);
    pos = oldPos;
  }
  void dead(){
   for(int i=0; i<2;i++){
    astroidesS.add(new AstroideS(this.direct.copy().rotate(radians(random(-90,90))),pos.copy()));  
   }
  }
}
