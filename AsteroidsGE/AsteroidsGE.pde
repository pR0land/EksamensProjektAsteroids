int gameState = 1;
int waveNr =1;
boolean waveChanged =true;
boolean alive = true,clearBig = true,clearMedium = true,clearSmall = true;
boolean rightPressed,leftPressed,upPressed;
boolean isShooting;
long lastMillisShot,lastMillisWave;
Player player1;
ArrayList<Shots> shot1;
ArrayList<AstroideL> astroidesL;
ArrayList<AstroideM>astroidesM;
ArrayList<AstroideS> astroidesS;
long score;
long highScore;

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
  //println(shot1.size());
  if(gameState == 1){  
    background(0);
    fill(255);
    textSize(20);
    text("Score: "+score,width-150,25);
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
      if(isShooting == true && lastMillisShot < millis()){
        shot1.add(new Shots());
        lastMillisShot = millis()+300;
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
    
    if(astroidesL.size() <= 0 && astroidesM.size() <= 0 && astroidesS.size() <= 0 && waveChanged == true){
        waveNr++;
        waveChanged = false;
        lastMillisWave = millis();
    }
    if(waveChanged == false && lastMillisWave +2500 < millis()){
      fill(240,20,60);
      textSize(50);
      textAlign(CENTER,CENTER);
      text("NEW WAVE INCOMING\n wave nr: "+waveNr,width/2,height/2); 
      textAlign(CORNER);
    }
    if(waveChanged == false && lastMillisWave +5000 < millis()){
       newWave(); 
       waveChanged = true;
    }
  }
}
void newWave(){
  for(int i=0; i<(int((waveNr+2)/2))*2;i++){
    astroidesL.add(new AstroideL());
  }
  for(int i=0; i<(waveNr+2)%2;i++){
    astroidesM.add(new AstroideM(new PVector(random(-1,1),random(-1,1)),astroidesL.get(i).pos.copy()));
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
