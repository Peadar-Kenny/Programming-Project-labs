
int y = 0;
int i = 0;
void setup(){
  size (500,500);
  fill (255,255,255);
  noStroke();
}
void draw(){
  background (0);
  rect(i++,20,50,50);
  if(i>=450){
    i=0;
  }
}
