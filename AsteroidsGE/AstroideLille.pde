class AstroideS extends AstroideL{
  AstroideS(){
    this.size = 25;
    this.speed =6;
    this.direct = PVector.fromAngle(random(-90,90),deadAstroideDirect);
  }
}
