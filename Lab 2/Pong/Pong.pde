final int SCREENX = 600;
final int SCREENY = 600;
final int PADDLEHEIGHT = 30;
final int PADDLEWIDTH = 100;
final int MARGIN = 10;
float computerMvmt = .5;
Player thePlayer;
Ball theBall;
Player theComputer;
boolean resetGame = false;
void settings(){
size(SCREENX, SCREENY);
}
void setup(){
thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
theBall = new Ball();
theComputer = new Player (0+MARGIN);
theComputer.wasHit = true;

ellipseMode(RADIUS);
}
void draw() {
  background(0);
  if(thePlayer.lives !=0 && theComputer.lives !=0){
  theBall.wallBounce();
  textSize(15);
  text(thePlayer.lives + "|" + theComputer.lives, 450, 100);
  thePlayer.move(mouseX-PADDLEWIDTH/2);
  theComputer.npcMvmt(computerMvmt);
  theComputer.move(theComputer.xpos);
  if (theBall.y >= (SCREENY-MARGIN)){
    thePlayer.lifeLoss();
  } else if(theBall.y <= MARGIN){
    theComputer.lifeLoss();
  }
  thePlayer.draw();
  theComputer.draw();
  theBall.draw();
  if (resetGame ==true){
    textSize(20);
    text("Click to continue",150, 250);
  }
  if (resetGame !=true){
  theBall.collide(theComputer);
  theBall.move();
  theBall.collide(thePlayer);
  }
}else 
{
 text("Game over", 200, 150);
 if(thePlayer.lives > theComputer.lives){
   textSize(30);
   text("The player won this game", 80, 270);
 }
 else{
   textSize(30);
   text("The computer won this game", 80, 270);
 }
 }
}
void mousePressed()
{
  resetGame = false;
}
