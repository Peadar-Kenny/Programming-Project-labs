import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class arrayVersion extends PApplet {

// Q2
Player thePlayer;
ArrayList <Bullet> bullets;
final int PADDLEWIDTH = 50;
final int PADDLEHEIGHT = 15;
int SCREENX = 600;
int SCREENY = 600;
Alien aliens[];
PImage spacer;
public void settings(){
  size(SCREENX, SCREENY);
}
public void setup(){
  aliens = new Alien[10];
  bullets = new ArrayList <Bullet>();
  spacer = loadImage("spacer.gif");
  initArray(aliens);
  thePlayer = new Player(SCREENY);
 
}
public void draw(){
  background(255);
  moveArray(aliens);
  drawArray(aliens);
  thePlayer.move(mouseX-PADDLEWIDTH/2);
  thePlayer.draw();
  for(Bullet bullet : bullets){
    for(int i=0; i<aliens.length; i++){
      bullet.collide(aliens[i]);
    }
    bullet.draw();
    bullet.move();
  }
}
public void initArray(Alien alienArr[]){
  for(int i=0; i<alienArr.length; i++){
      alienArr[i] = new Alien(0+i*spacer.width,0, spacer);
  }
}
public void drawArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
    alienArr[i].draw();
  }
}
public void moveArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
      alienArr[i].move();
  }
    }
public void mousePressed(){
  bullets.add(new Bullet());
}
  

class Alien {
  float x; float y;
  int dir = 1;
  PImage explode = loadImage("exploding.gif");
  int count;
  int heightDiff;
  int exploded;
  boolean special;
  float dy; float dx;
  float angle;
  PImage sprite;
  Alien(int xpos, int ypos, PImage image){
    x = xpos; y = ypos;
    exploded = 0;
    count = 0;
    sprite = image;
    heightDiff = sprite.height;
  }
  public void move(){
    if(exploded<1){
      if(x<0 || (x+sprite.width >= width)){
        if(count<heightDiff){
          y++;
          count++;
        } else {
          dir*=-1;
          x+=dir;
          count = 0;
        };
      } else {
        x += dir;
      }
    }
  }
  public void draw(){
    if(exploded>=1 && exploded<25){
      image(explode, x, y);
      exploded++;
    } else if(exploded==0){        
      image(sprite, x, y);
    }
  }
  public void explode(){
    exploded++;  
    }
  }
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
  public void move(){
   y = y - dy; 
  }
  public void draw(){
    image(bullet,x, y); 
  }
  public void collide(Alien alien){
    if(x >= alien.x && x <=alien.x +spacer.width && y >=alien.y && y<=alien.y + spacer.height){
      alien.explode();  
    }
    
  }
}
class Player{ 
float xpos; float ypos;
int paddlecolor = color(0);
int lives;
boolean wasHit;
Player(int screen_y)
{
lives = 3;  
xpos=SCREENX/2;
ypos=screen_y-25;
}
public void move(float x){
if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
else if(x<=0) xpos=0;
else xpos=x;
}
public void draw()
{
fill(paddlecolor);
rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "arrayVersion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
