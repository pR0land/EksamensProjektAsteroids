int gameState = 1;
boolean rightPressed;
boolean leftPressed;
boolean upPressed;
boolean isShooting;
long lastMillis;
Player player1;
ArrayList<Shots> shot1;
ArrayList<AstroideL> astroidesL;
ArrayList<AstroideM>astroidesM;
ArrayList<AstroideS> astroidesS;
PVector deadAstroideDirect;
PVector deadAsPos;


void setup(){
  frameRate(60);
  size(800,800);
  astroidesL = new ArrayList<AstroideL>(0);
  astroidesM = new ArrayList<AstroideM>(0);
  astroidesS = new ArrayList<AstroideS>(0);
  for(int i=0; i<3; i++){
    astroidesL.add(new AstroideL()); 
  }
  player1 = new Player();
  shot1 = new ArrayList<Shots>(0);
}

void draw(){
  if(gameState == 1){
    background(0);
    player1.playerRotate();
    player1.playerMove();
    player1.checkPlayerEdges();
    player1.drawPlayer();
    player1.playerCollision();
  
    for(int i = 0; i < shot1.size(); i++){
      shot1.get(i).shotsDraw();
      shot1.get(i).shotCollision();
      if(shot1.get(i).shotHit == true){
         shot1.remove(i);
      }
      println(shot1.size());
    }
    if(isShooting == true && lastMillis < millis()){
      shot1.add(new Shots());
      lastMillis = millis()+500;
    }
    for(int i=0; i<astroidesL.size();i++){
      astroidesL.get(i).displayAstroide();
      astroidesL.get(i).astroideMove();
      astroidesL.get(i).asCheckEdges();
    }
    for(int i=0; i<astroidesM.size();i++){
      astroidesM.get(i).displayAstroide();
      astroidesM.get(i).astroideMove();
      astroidesM.get(i).asCheckEdges();
    }
    for(int i=0; i<astroidesS.size();i++){
      astroidesS.get(i).displayAstroide();
      astroidesS.get(i).astroideMove();
      astroidesS.get(i).asCheckEdges();
    }
    if(gameState == 2){
      background(50);
    }
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
