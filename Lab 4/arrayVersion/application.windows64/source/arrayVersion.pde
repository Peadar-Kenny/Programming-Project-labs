// Q2
Player thePlayer;
ArrayList <Bullet> bullets;
final int PADDLEWIDTH = 50;
final int PADDLEHEIGHT = 15;
int SCREENX = 600;
int SCREENY = 600;
Alien aliens[];
PImage spacer;
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  aliens = new Alien[10];
  bullets = new ArrayList <Bullet>();
  spacer = loadImage("spacer.gif");
  initArray(aliens);
  thePlayer = new Player(SCREENY);
 
}
void draw(){
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
void initArray(Alien alienArr[]){
  for(int i=0; i<alienArr.length; i++){
      alienArr[i] = new Alien(0+i*spacer.width,0, spacer);
  }
}
void drawArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
    alienArr[i].draw();
  }
}
void moveArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
      alienArr[i].move();
  }
    }
void mousePressed(){
  bullets.add(new Bullet());
}
  
