boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean isShooting;
long lastMillis;
Player player1;
Shots[] shot1;
AstroideL[] astroides;

void setup(){
  frameRate(60);
  size(800,800);
  astroides = new AstroideL[0];
  for(int i=0; i<3; i++){
    astroides = (AstroideL[])append(astroides, new AstroideL()); 
  }
  player1 = new Player();
  shot1 = new Shots[0];
}

void draw(){
  background(0);
  player1.playerRotate();
  player1.playerMove();
  player1.checkPlayerEdges();
  player1.drawPlayer();
  
  for(int i = 0; i < shot1.length; i++){
    shot1[i].shotsDraw();
  }
  if(isShooting == true && lastMillis < millis()){
    shot1 = (Shots[])append(shot1, new Shots());
    lastMillis = millis()+500;
  }
  for(int i=0; i<astroides.length;i++){
    astroides[i].displayAstroide();
    astroides[i].astroideMove();
    astroides[i].asCheckEdges();
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
