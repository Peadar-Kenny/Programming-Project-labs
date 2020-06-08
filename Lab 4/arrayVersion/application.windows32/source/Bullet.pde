class Bullet{
  float x; float y;
  float dy;
  boolean canBeSeen;
  PImage bullet;
  
  Bullet(){
    x = thePlayer.xpos+(PADDLEWIDTH/2);
    y = thePlayer.ypos;
    dy= 2;
    bullet = loadImage("bullet.png");
  }
  void move(){
   y = y - dy; 
  }
  void draw(){
    image(bullet,x, y); 
  }
  void collide(Alien alien){
    if(x >= alien.x && x <=alien.x +spacer.width && y >=alien.y && y<=alien.y + spacer.height){
      alien.explode();  
    }
    
  }
}
