class Ball {
float x; float y;
float dx; float dy;
int radius;
color ballColor = color(200, 100, 50);
Ball(){
x = random(SCREENX/4, SCREENX/2);
y = random(SCREENY/4, SCREENY/2);
dx = (2); dy =  (2);
radius=10;
}
void move(){
x = x+dx; y = y+dy;
}
void draw(){
fill(ballColor);
ellipse(int(x), int(y), radius,
radius);
}
void collide(Player tp){
if(y+radius >= tp.ypos &&
y-radius<tp.ypos+PADDLEHEIGHT &&
x >=tp.xpos &&
x <= tp.xpos+PADDLEWIDTH){
println("collided!");
dy=-dy;
dy=dy+.5;
dx=dx+.5;
}
}
void reset()
{
  x = random(SCREENX/4, SCREENX/2);
  y = random(SCREENY/4, SCREENY/2);
  dx = random(1, 2); dy = random(1, 2);
  radius=10;
  resetGame = true;
  println("Click to continue");
}
void wallBounce(){
if(x+radius>= SCREENX || x-radius <=0)
{
dx=-dx;  
}
}
}
