
int y = 0;
int i = 0;
void setup(){
  size (500,500);
  fill (255,255,255);
  noStroke();
}
void draw(){
  background(0);
  rect(i,20,50,50);
  i++;
  frameRate(20);
  rect (40,y,50,50);
  y++;
  rect(i,y,50,50);
}
