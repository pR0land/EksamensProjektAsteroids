class AstroideL{
  int size;
  int speed;
  PVector direct;
  PVector pos;
  AstroideL(){
    this.size = 125;
    this.speed =1;
    this.direct = new PVector(random(-1,1),random(-1,1));
    //sætter længden på vectoren til speed
    this.direct.setMag(this.speed);
    this.pos = new PVector(random(width),random(height));
    //for at sikre den ikke spawner oven i playeren, giver vi den en ny pos når den er i midten
    while(this.pos.x < width/2 + 50 && this.pos.x > width/2 - 50 && this.pos.y < height/2 + 50 && this.pos.y > height/2 - 50){
      this.pos = new PVector(random(width),random(height));
    }
  }
  void astroideMove(){
    this.pos.add(direct);
  }
  void displayAstroide(){
    stroke(255);
    fill(60);
    circle(this.pos.x,this.pos.y,size); 
    stroke(0);
  }
  void asCheckEdges(){
    if(this.pos.x > width + (this.size/2+10)){
      this.pos.x = 0 - (this.size/2+10);
    }else if(this.pos.x < 0 - (this.size/2+10)){
      this.pos.x = width + (this.size/2+10);
    }
    if(this.pos.y > height + (this.size/2+10)){
      this.pos.y = 0 - (this.size/2+10);
    }else if(this.pos.y < 0 - (this.size/2+10)){
      this.pos.y = height + (this.size/2+10);
    }
  }
}
