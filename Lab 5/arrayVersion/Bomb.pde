class Bomb {
 float x; float y;
 float dy; 
 PImage sprite;
 boolean bombExists;
 Bomb(float xpos, float ypos){
   x = xpos;
   y = ypos;
   dy = 2;
   sprite = loadImage("Bomb.png");
   bombExists = true;
 }
 void move(){
   y = y + dy;
 }
 void draw(){
  
  if(offScreen() == true);
   image(sprite, x, y); 
 }
 boolean offScreen(){
  if(y+sprite.height>= SCREENY){ //<>//
    return true; //<>//
  } //<>//
  else{ //<>//
   return false;  //<>//
  }
 }
  boolean collide(Player tp){
   if(x >tp.xpos && x< tp.xpos + PADDLEWIDTH || x+sprite.width > tp.xpos && x+sprite.width < tp.xpos + PADDLEWIDTH){
     if(y + sprite.height >= tp.ypos) return true;
     else return false;
   }
   return false;
  }
 }
