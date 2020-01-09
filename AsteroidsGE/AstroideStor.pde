class AstroideL{
  int size;
  int speed;
  PVector direct;
  PVector pos;
  AstroideL(){
    this.size = 50;
    this.speed =1;
    this.direct = new PVector(random(width),random(height));
    this.pos = new PVector(random(width),random(height));
    while(this.pos.x < width/2 + 50 && this.pos.x > width/2 - 50 && this.pos.y < height/2 + 50 && this.pos.y > height/2 - 50){
      this.pos = new PVector(random(width),random(height));
    }
  }

}
