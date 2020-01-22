int gameState = 1;
boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean isShooting;
long lastMillis;
Player player1;
Shots[] shot1;
AstroideL[] astroidesL;

AstroideM[] astroidesM;
AstroideS[] astroidesS;
PVector deadAstroideDirect;


void setup(){
  frameRate(60);
  size(800,800);
  astroidesL = new AstroideL[0];
  astroidesM = new AstroideM[0];
  astroidesS = new AstroideS[0];
  for(int i=0; i<3; i++){
    astroidesL = (AstroideL[])append(astroidesL, new AstroideL()); 
  }
  player1 = new Player();
  shot1 = new Shots[0];
}

void draw(){
  if(gameState == 1){
    background(0);
    player1.playerRotate();
    player1.playerMove();
    player1.checkPlayerEdges();
    player1.drawPlayer();
    player1.playerCollision();
  
    for(int i = 0; i < shot1.length; i++){
      shot1[i].shotsDraw();
      shot1[i].shotCollision();
  }
    if(isShooting == true && lastMillis < millis()){
      shot1 = (Shots[])append(shot1, new Shots());
      lastMillis = millis()+500;
  }
  for(int i=0; i<astroidesL.length;i++){
    astroidesL[i].displayAstroide();
    astroidesL[i].astroideMove();
    astroidesL[i].asCheckEdges();
  }
  for(int i=0; i<astroidesM.length;i++){
    astroidesL[i].displayAstroide();
    astroidesL[i].astroideMove();
    astroidesL[i].asCheckEdges();
  }
  for(int i=0; i<astroidesS.length;i++){
    astroidesL[i].displayAstroide();
    astroidesL[i].astroideMove();
    astroidesL[i].asCheckEdges();
  }
  if(gameState == 2){
    background(50);
  }
}

void keyReleased(){
if(keyCode == RIGHT){
     rightPressed = false;  
   }
if(keyCode == LEFT){
     leftPressed = false;
   }
if(keyCode == UP){
     upPressed = false;  
   }
if(keyCode == 'X'){
     isShooting = false;
   }
}

void keyPressed(){
if(keyCode == RIGHT){
     rightPressed = true;  
    }
if(keyCode == LEFT){
     leftPressed = true;  
    }
if(keyCode == UP){
     upPressed = true;  
    }
if(keyCode == 'X'){
     isShooting = true;
    }
}
