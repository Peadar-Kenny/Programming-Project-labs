class Player{ 
float xpos; float ypos;
color paddlecolor = color(0);
int lives;
boolean wasHit;
Player(int screen_y)
{
lives = 3;  
xpos=SCREENX/2;
ypos=screen_y-PADDLEHEIGHT;
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
}
