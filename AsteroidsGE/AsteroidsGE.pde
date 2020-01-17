boolean rightPressed;
boolean leftPressed;
boolean upPressed;
Player player1;

void setup(){
size(800,800);
player1 = new Player();
}

void draw(){
  background(0);
  player1.playerRotate();
  player1.playerMove();
  player1.checkPlayerEdges();
  player1.drawPlayer();
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
}
