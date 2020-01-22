class Shots{
int shotHeight = 10;
int shotWidth = 3;
PVector shotPos;
PVector shotForward;
color shotColor = color(255);
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
    fill(shotColor);
    rect(0, 0, shotWidth, shotHeight);
    pop();
    this.shotPos.add(this.shotForward);
  }
  
  void shotCollision(){
  for(int i = 0; i < astroidesL.length; i++){
     if(shotPos.x < astroidesL[i].pos.x+astroidesL[i].size/2 && shotPos.x > astroidesL[i].pos.x-astroidesL[i].size/2 && shotPos.y < astroidesL[i].pos.y+astroidesL[i].size/2 && shotPos.y > astroidesL[i].pos.y-astroidesL[i].size/2){
       gameState = 2;
       //astroidesL[i].dead();
     }
   }
   /*for(int i = 0; i < astroidesL.length; i++){
     if(shotPos.x < astroidesM[i].pos.x+astroidesM[i].size/2 && shotPos.x > astroidesM[i].pos.x-astroidesM[i].size/2 && shotPos.y < astroidesM[i].pos.y+astroidesM[i].size/2 && shotPos.y > astroidesM[i].pos.y-astroidesM[i].size/2){
       gameState = 2;
       //astroidesM[i].dead();
     }
   }*/
   /*for(int i = 0; i < astroidesL.length; i++){
     if(shotPos.x < astroidesS[i].pos.x+astroidesS[i].size/2 && shotPos.x > astroidesS[i].pos.x-astroidesS[i].size/2 && shotPos.y < astroidesS[i].pos.y+astroidesS[i].size/2 && shotPos.y > astroidesS[i].pos.y-astroidesS[i].size/2){
       gameState = 2;
       //astroidesS[i].bigDead();
     }
   }*/
  }
}
