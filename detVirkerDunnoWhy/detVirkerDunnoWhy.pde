PVector direct1 = new PVector(1,1);
PVector pos1;
ArrayList<Me> m; 
PVector di1 = new PVector(random(-1,1),random(-1,1));

void setup(){
 size(800,800);
 pos1 = new PVector(width/2,height/2);
 m = new ArrayList<Me>(0);
 for(int i =0; i< 2; i++){
   int a = int(random(-90,90));
  m.add(new Me(di1.copy().rotate(radians(a)))); 
 }
}
void draw(){
 background(0); 
 fill(255);
 circle(pos1.x,pos1.y,50);
 pos1.add(direct1);
 for(int i =0; i< m.size(); i++){
  m.get(i).drawMe(); 
  m.get(i).move();
  //println(m.get(i).direct);
 }
}
class Me{
  PVector pos;
  PVector direct;
 Me(PVector oldDir){
  pos = new PVector(width/2,height/2);
  this.direct = oldDir;
  //this.direct.rotate(radians(random(-90-90)));
  println(direct);
  
 }
 void drawMe(){
   fill(60);
   circle(pos.x,pos.y,50);
 }
 void move(){
   //println(this.direct);
   pos.add(this.direct);
   println(direct);
 }
}
