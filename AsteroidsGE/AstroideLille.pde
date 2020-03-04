class AstroideS extends AstroideL{
  AstroideS(PVector oldDirect,PVector oldPos){
    this.size = 30;
    this.speed =5;
    this.direct = oldDirect;
    this.direct.setMag(this.speed);
    this.pos = oldPos;
  }
}
