class Player{
 int playerHeight = 50;
 int playerWidth = 50;
 PVector playerPos;
 color playerColor = color(255);
 int playerFaceHeight = 10;
 int playerFaceWidth = 10;
 float playerFaceX;
 float playerFaceY;
 color playerFaceColor = color(0,255,0);
 int angle = 0;
  
 Player(){
 playerPos = new PVector(width/2, height/2);
 playerFaceX = playerPos.x;
 playerFaceY = playerPos.y-20;
 }
 
 void drawPlayer(){
   push();
   translate(playerPos.x, playerPos.y);
   rotate(radians(angle));
   rectMode(CENTER);
   fill(playerColor);
   rect(0, 0, playerWidth, playerHeight);
   fill(playerFaceColor);
   rect(0, 0-20, playerFaceWidth, playerFaceHeight);
   rectMode(CORNER);
   pop();
 }
 
 void playerMove(){
   
   if(upPressed == true){
   PVector forward = new PVector(0,-1);
   forward.rotate(radians(angle));
   playerPos.add(forward);
   }
 }
 
 void playerRotate(){
   if(rightPressed == true){
   angle = angle +5;
   }
   if(leftPressed == true){
   angle = angle -5;
   } 
 }
}
