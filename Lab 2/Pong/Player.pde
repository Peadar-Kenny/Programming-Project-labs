class Player {
float xpos; float ypos;
color paddlecolor = color(255);
int lives;
boolean wasHit;
Player(int screen_y)
{
lives = 3;  
xpos=SCREENX/2;
ypos=screen_y;
wasHit = false;
}
void move(float x){
if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
else if(x<=0) xpos=0;
else xpos=x;
}
void draw()
{
fill(paddlecolor);
rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
}
void npcMvmt(float x)
{
 if(theBall.x > xpos+ (PADDLEWIDTH/2)){
     xpos = xpos + x;
 }
 if(theBall.x < xpos + (PADDLEWIDTH/2)){
  xpos = xpos - x; 
 }
}
void lifeLoss(){
  theBall.reset();
  lives--; //<>//
  computerMvmt = computerMvmt + 1; //<>// //<>// //<>//
}
}
