class AstroideS extends AstroideL{
  AstroideS(){
    this.size = 25;
    this.speed =3;
    this.direct = PVector.fromAngle(radians(random(-90,90)),deadAstroideDirect);
    this.direct.setMag(this.speed);
    this.pos = deadAsPos;
  }
}
