class AstroideM extends AstroideL{
  AstroideM(){
    this.size = 75;
    this.speed =2;
    int a = int(random(-90,90));
    this.direct = deadAstroideDirect.rotate(radians(a));
    this.direct.setMag(this.speed);
        println(this.direct);
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
