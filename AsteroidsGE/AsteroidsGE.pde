int gameState = 1;
boolean alive = true;
boolean clearBig = true;
boolean clearMedium = true;
boolean clearSmall = true;
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
long score;

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
  score =0;
}

void draw(){
  println(score);
  if(gameState == 1){
    background(0);
    //println(alive);
    //ellipseMode(CENTER);
    //ellipse(width/2,height/2,175,175);
    //ellipseMode(CORNER);
    if(alive == true){
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
    }
      if(isShooting == true && lastMillis < millis()){
        shot1.add(new Shots());
        lastMillis = millis()+300;
      }
    }
    
    else if(alive == false){
      if(clearBig == true && clearMedium == true && clearSmall == true){
    alive = true;
    }
      for(int i = 0; i < astroidesL.size(); i++){
        float lDist = dist(width/2,height/2,astroidesL.get(i).pos.x,astroidesL.get(i).pos.y);
        //println(lDist);  
          if(lDist > astroidesL.get(i).size+50){
            clearBig = true;
            }
          else if(lDist < astroidesL.get(i).size/2+50){
            clearBig = false;
            break;
          }        
        }
      for(int i = 0; i < astroidesM.size(); i++){
        float mDist = dist(width/2,height/2,astroidesM.get(i).pos.x,astroidesM.get(i).pos.y);
        //println(mDist);  
          if(mDist > astroidesM.get(i).size+65){
            clearMedium = true;
            }
          else if(mDist < astroidesM.get(i).size+65){
            clearMedium = false;
            break;
          }        
        }
      for(int i = 0; i < astroidesS.size(); i++){
        float sDist = dist(width/2,height/2,astroidesS.get(i).pos.x,astroidesS.get(i).pos.y);
        //println(sDist);  
          if(sDist > astroidesS.get(i).size+100){
            clearSmall = true;
            }
          else if(sDist < astroidesS.get(i).size+100){
            clearSmall = false;
            break;
        }        
      }
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
      //println(astroidesM.get(i).direct);
    }
    for(int i=0; i<astroidesS.size();i++){
      astroidesS.get(i).displayAstroide();
      astroidesS.get(i).astroideMove();
      astroidesS.get(i).asCheckEdges();
    }
    if(player1.playerHealth <= 0){
      player1.playerColor = color(255,0,0);
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
