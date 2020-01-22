class Shots{
int shotHeight = 10;
int shotWidth = 3;
PVector shotPos;
PVector shotForward;
int shotAngle;

  Shots(){
    this.shotPos = new PVector(player1.playerPos.x, player1.playerPos.y);
    this.shotForward = new PVector(0,-12);
    this.shotForward.rotate(radians(player1.angle));
    this.shotAngle = player1.angle;
    
  }
  
  void shotsDraw(){
    push();
    translate(this.shotPos.x, this.shotPos.y);
    rotate(radians(this.shotAngle));
    rect(0, 0, shotWidth, shotHeight);
    pop();
    this.shotPos.add(this.shotForward);
  }
}
