class Shots{
int shotHeight = 10;
int shotWidth = 3;
PVector shotPos;
PVector shotForward;
color shotColor = color(255);
int shotAngle;
boolean shotHit;

  Shots(){
    this.shotPos = new PVector(player1.playerPos.x, player1.playerPos.y);
    this.shotForward = new PVector(0,-10);
    this.shotForward.rotate(radians(player1.angle));
    this.shotAngle = player1.angle;
    this.shotHit = false;
  }
  
  void shotsDraw(){
    push();
    translate(this.shotPos.x, this.shotPos.y);
    rotate(radians(this.shotAngle));
    fill(shotColor);
    rect(0, 0, shotWidth, shotHeight);
    pop();
    this.shotPos.add(this.shotForward);
  }
  
  void shotCollision(){
  for(int i = 0; i < astroidesL.size(); i++){
     if(shotPos.x < astroidesL.get(i).pos.x+astroidesL.get(i).size/2 && shotPos.x > astroidesL.get(i).pos.x-astroidesL.get(i).size/2 && shotPos.y < astroidesL.get(i).pos.y+astroidesL.get(i).size/2 && shotPos.y > astroidesL.get(i).pos.y-astroidesL.get(i).size/2){
       astroidesL.get(i).dead();
       astroidesL.get(i).givePoints();
       astroidesL.remove(i);
       this.shotHit = true;
     }
   }
   for(int i = 0; i < astroidesM.size(); i++){
     if(shotPos.x < astroidesM.get(i).pos.x+astroidesM.get(i).size/2 && shotPos.x > astroidesM.get(i).pos.x-astroidesM.get(i).size/2 && shotPos.y < astroidesM.get(i).pos.y+astroidesM.get(i).size/2 && shotPos.y > astroidesM.get(i).pos.y-astroidesM.get(i).size/2){
       astroidesM.get(i).dead();
       astroidesM.get(i).givePoints();
       astroidesM.remove(i);
       this.shotHit = true;
     }
   }
   for(int i = 0; i < astroidesS.size(); i++){
     if(shotPos.x < astroidesS.get(i).pos.x+astroidesS.get(i).size/2 && shotPos.x > astroidesS.get(i).pos.x-astroidesS.get(i).size/2 && shotPos.y < astroidesS.get(i).pos.y+astroidesS.get(i).size/2 && shotPos.y > astroidesS.get(i).pos.y-astroidesS.get(i).size/2){
       astroidesS.get(i).givePoints();
       astroidesS.remove(i);
       this.shotHit = true;
     }
   }
  }
}
