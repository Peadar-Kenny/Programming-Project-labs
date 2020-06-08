float y = 450;
float i = 200;
float sinI = 0;
float sinY = 0;
int colour = 0;
boolean colourReset = false;
void setup(){
  size (500,500);
}
void draw(){
  background (255, 180, 110);
  rect(i++,200+sinI,50,50);
  sinI = sin(i*0.1) *100;
  sinY = sin(y*0.1) *100;
  fill (colour-150,colour,colour -100);
  rect(y--,100+sinY,50,50);
  if(i>=450 && i<500){
    rect(0,200+sinI,i%50,50);
  } else if(i>=500) i=0;
  if(y<=0 && y > -50){
   rect(500,100 +sinY,y,50); 
  } else if(y<-50) y = 450;
  if(colourReset == false) colour++;
  else colour--;
  if (colour >= 255) colourReset = true;
  if (colour < 0) colourReset = false; //<>// //<>//
}
