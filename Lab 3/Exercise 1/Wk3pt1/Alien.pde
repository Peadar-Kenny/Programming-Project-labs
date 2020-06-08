final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int A_WIDTH = 30;
final int A_LENGTH = 25;

class Alien {
  int xpos; int ypos;
  int dx; int dy;
  PImage alienSprite;
  alienSprite = loadImage(spacer.gif);
  

 Alien(int xpos, int ypos, PImage alienSprite){
  xpos=10;
  ypos=10;
  image(alienSprite, 30,25);
  dx = 2; dy = 2;
 }
  
 void move(){
  if (x+A_WIDTH < SCREENX-MARGIN){
   xpos=xpos+dx; 
  }
 }
  
  void draw(){
    image(alienSprite,100,100);
  }
}
