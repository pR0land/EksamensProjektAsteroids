class Player{
 int playerHeight = 50;
 int playerWidth = 50;
 int playerHealth = 3;
 PVector playerVelocity;
 PVector playerPos;
 PVector playerAcceleration;
 color playerColor = color(255);
 int playerFaceHeight = 10;
 int playerFaceWidth = 10;
 float playerFaceX;
 float playerFaceY;
 color playerFaceColor = color(0,255,0);
 int angle = 0;
 float topSpeed;
   
 Player(){
 playerPos = new PVector(width/2, height/2);
 playerFaceX = playerPos.x;
 playerFaceY = playerPos.y-20;
 playerVelocity = new PVector(0,0);
 topSpeed = 3;
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
 
 void playerCollision(){
   for(int i = 0; i < astroidesL.size(); i++){
     boolean collision = circleRect(astroidesL.get(i).pos.x,astroidesL.get(i).pos.y,astroidesL.get(i).size/2, playerPos.x, playerPos.y, playerWidth/2, playerHeight/2);
       if (collision){
         playerHealth--;
         dead();
       }
   }
   for(int i = 0; i < astroidesM.size(); i++){
     boolean collision = circleRect(astroidesM.get(i).pos.x,astroidesM.get(i).pos.y,astroidesM.get(i).size/2, playerPos.x, playerPos.y, playerWidth/2, playerHeight/2);
       if (collision){
         playerHealth--;
         dead();
       }
   }
   for(int i = 0; i < astroidesS.size(); i++){
     boolean collision = circleRect(astroidesS.get(i).pos.x,astroidesS.get(i).pos.y,astroidesS.get(i).size/2, playerPos.x, playerPos.y, playerWidth/2, playerHeight/2);
       if (collision){
         playerHealth--;
         dead();
       }
   }
 } 
 void playerMove(){
   /*PVector forward = new PVector(0,-4);
   forward.rotate(radians(angle));
   playerPos.add(forward);*/
   if(upPressed == true){
   playerAcceleration = new PVector(0,-4);
   playerAcceleration.setMag(0.25);
   playerAcceleration.rotate(radians(angle));
   playerVelocity.add(playerAcceleration);
   playerVelocity.limit(topSpeed);
   }
   playerPos.add(playerVelocity);
   playerVelocity = playerVelocity.mult(0.985);
   
   //playerVelocity.rotate(radians(angle));
 }
 
 void playerRotate(){
   if(rightPressed == true){
   angle = angle +5;
   }
   if(leftPressed == true){
   angle = angle -5;
   } 
 }
 
 boolean circleRect (float ax, float ay,float aSize, float px, float py, float pWidth, float pHeight){
        
        //midlertidige variabler til kanterne
        float testX = ax;
        float testY = ay;
        
        //hvilken kant på firkanten er tættest på
        if (ax < px){
          testX = px-pWidth; //test venstre kant
        }
        else if (ax > px+pWidth){
          testX = px+pWidth; //test på højre kant
        }
        if (ay < py){
          testY = py-pHeight; //test på toppen
        }
        else if (ay > py+pHeight){
          testY = py+pHeight; //test på bunden
        }
        
        //find distancen til nærmeste kant
        float distX = ax-testX;
        float distY = ay-testY;
        float distance = sqrt((distX*distX) + (distY*distY));
        
        //hvis distancen er mindre end radius på asteroiden er der kollision
        if(distance <= aSize){
          return true;
        }
        return false;
 }

  void dead(){
     playerPos = new PVector(width/2, height/2);
     playerVelocity = playerVelocity.mult(0);
     alive = false;
     if(astroidesS.size() > 0){
       clearSmall = false;
     }
     if(astroidesM.size() > 0){
       clearMedium = false;
     }
     if(astroidesL.size() > 0){
       clearBig = false;
     }
  }
  void respawn(){
     playerPos = new PVector(width/2, height/2);
     alive = true;
  }
}
