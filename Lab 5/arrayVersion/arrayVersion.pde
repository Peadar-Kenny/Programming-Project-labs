// Q2
Player thePlayer;
ArrayList <Bullet> bullets;
final int PADDLEWIDTH = 50;
final int PADDLEHEIGHT = 15;
int SCREENX = 600;
int SCREENY = 600;
Alien aliens[];
ArrayList <Bomb> bombs;
boolean gameOver;
PImage spacer;
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  bombs = new ArrayList <Bomb>();
  aliens = new Alien[10];
  bullets = new ArrayList <Bullet>();
  spacer = loadImage("spacer.gif");
  initArray(aliens);
  thePlayer = new Player(SCREENY);
  gameOver = false;
}
void draw(){
  background(255);
  
  if(gameOver != true){
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
  for(Bomb bomb : bombs){
    if(!bomb.offScreen()){
      if(gameOver == false){
        bomb.draw();
        bomb.move();
        if(bomb.collide(thePlayer)){
          gameOver = true;
        }
  }
  
  }
}
}
else{
 textSize(25);
 text("Game Over", SCREENX/2, SCREENY/2); 
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
  
