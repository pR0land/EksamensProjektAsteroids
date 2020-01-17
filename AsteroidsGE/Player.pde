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
 
 void checkPlayerEdges(){
   if(playerPos.x-(playerWidth/2+5) > width){
   playerPos.x = 0-(playerWidth/2);
   }
   if(playerPos.x+(playerWidth/2+5) < 0){
   playerPos.x = width+(playerWidth/2);
   }
   if(playerPos.y-(playerHeight/2+5) > height){
   playerPos.y = 0-(playerHeight/2);
   }
   if(playerPos.y+(playerHeight/2+5) < 0){
   playerPos.y = height+(playerHeight/2);
   }
 }
 
 void playerMove(){
   
   if(upPressed == true){
   PVector forward = new PVector(0,-4);
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
