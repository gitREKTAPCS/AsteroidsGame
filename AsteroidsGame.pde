//your variable declarations here
SpaceShip ship = new SpaceShip();
Star rhinohippomachine[] = new Star[500];
ArrayList <Asteroids> aster = new ArrayList <Asteroids>();
ArrayList <Bullet> bull = new ArrayList <Bullet>();
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;
boolean spaceIsPressed = false;
boolean rIsPressed = false;
PFont f;
int pointCounter=0;
String pointScore;
BossAsteroid boss = new BossAsteroid();
BossAsteroid boss2 = new BossAsteroid();
BossAsteroid boss3 = new BossAsteroid();
boolean loser = false;
boolean gameOver = false;


public void setup() 
{
  size(500, 500);
  for(int i =0; i<rhinohippomachine.length; i++){
  rhinohippomachine[i] = new Star();
}
  
  for(int x=0; x<13; x++){
    aster.add(new Asteroids());
    if(dist(aster.get(x).getX(),aster.get(x).getY(),ship.getX(),ship.getY())<=40){
    aster.get(x).setX((int)(Math.random()*500));
    aster.get(x).setY((int)(Math.random()*500));
  }
  }

  f = createFont("Calbri",34,true);          

}

public void draw() 
{

  

  if(gameOver == true )
  {
    background(0);
    textFont(f,16);                 
    fill(255);                        
    text("YOU LOOOOOOOOSE!!!",160,206); 
    text("Refresh Page to Restart",160,226);
    text("Score: ",160,276);
    text(pointScore,220,276);
    loser=true;
    if(mousePressed == true){
      redraw();
    }
  } 
  else{

  background(0);
 pointScore="Points: "+pointCounter;
text(pointScore,390,15); 
fill(255);
textSize(15);
 ship.setRed((int)(Math.random()*255));
 ship.setGreen((int)(Math.random()*255));
 ship.setBlue((int)(Math.random()*255));

for(Star rhinoTemp: rhinohippomachine){
  rhinoTemp.show();
}


 ship.move();
  ship.show();

for(int i =0; i<aster.size(); i++){
  aster.get(i).move();
  
  aster.get(i).show();

  for(int x =0; x<bull.size(); x++){
    if(dist(aster.get(i).getX(),aster.get(i).getY(),bull.get(x).getX(),bull.get(x).getY())<=20){
      aster.remove(i);
      pointCounter+=10;
      aster.add(new Asteroids());  
      bull.remove(x);
      
      break;
    }
 
  }
}

if(pointCounter>=1000){
   boss.move();
   if(boss.getHits()<=7){
     boss.show();
   }
   else{
     pointCounter+=100;
   }

  if(dist(boss.getX(),boss.getY(),ship.getX(),ship.getY())<=20){
   //lose();
   gameOver = true;
  }

  for(int x =0; x<bull.size(); x++){
    if(dist(boss.getX(),boss.getY(),bull.get(x).getX(),bull.get(x).getY())<=100){
      pointCounter+=10; 
      bull.remove(x);
      boss.addHits();
      
    }
 
  }

}

if(pointCounter>=10000){
   boss3.move();
   boss2.move();
   if(boss3.getHits()<=7){
     boss3.show();
   }
   if(boss2.getHits()<=7){
     boss2.show();
   }

  if(dist(boss3.getX(),boss3.getY(),ship.getX(),ship.getY())<=20){
   //lose();
   gameOver = true;
  }
  if(dist(boss2.getX(),boss2.getY(),ship.getX(),ship.getY())<=20){
    //lose();
   gameOver = true;
  }

  for(int x =0; x<bull.size(); x++){
    if(dist(boss3.getX(),boss3.getY(),bull.get(x).getX(),bull.get(x).getY())<=100){
      pointCounter+=10; 
      bull.remove(x);
      boss3.addHits();
      break;
      
    }
    if(dist(boss2.getX(),boss2.getY(),bull.get(x).getX(),bull.get(x).getY())<=100){
      pointCounter+=10; 
      bull.remove(x);
      boss2.addHits();
      break;
      
    }
 }
  }

for(int x =0; x<bull.size(); x++){   
  bull.get(x).move();
  bull.get(x).show();
 
 if(bull.get(x).getX() >width)
    {     
     bull.remove(x); 
     break;  
    }    
    else if (bull.get(x).getX()<0)
    {     
     bull.remove(x);
     break;    
    }    
    if(bull.get(x).getY() >height)
    {    
     bull.remove(x);
     break;    
    }   
    else if (bull.get(x).getY() < 0)
    {     
     bull.remove(x);
     break;
      }  

}

for(int i =0; i<aster.size(); i++){
  if(dist(aster.get(i).getX(),aster.get(i).getY(),ship.getX(),ship.getY())<=20){
  gameOver = true;
  //lose();
  }

  }
}
}




/*public void lose(){
    background(0);
    textFont(f,16);                 
    fill(255);                        
    text("YOU LOOOOOOOOSE!!!",160,206); 
    text("Refresh Page to Restart",160,226);
    text("Score: ",160,276);
    text(pointScore,220,276); 
    loser=true;
    noLoop();
 }*/
 
 
 
public void keyPressed(){

  //acclerate + decelerate with limits

  if(aIsPressed == true && wIsPressed == true)
  {
    ship.accelerate(.1);
    ship.setForward(true);
    ship.rotate(-5);

  }
  if(sIsPressed == true && dIsPressed == true)
  {
    ship.declerate(.1);
    ship.setBackward(true);
    ship.rotate(5);
  }
   if(aIsPressed == true && sIsPressed == true)
  {
    ship.declerate(.1);
    ship.setBackward(true);
    ship.rotate(-5);

  }
  if(wIsPressed == true && dIsPressed == true)
  {
    ship.accelerate(.1);
    ship.setForward(true);
    ship.rotate(5);
  }

  if(aIsPressed == true && spaceIsPressed == true)
  {
    ship.rotate(-5);
    bull.add(new Bullet(ship));

  }

  if(dIsPressed == true && spaceIsPressed == true)
  {
    ship.rotate(5);
    bull.add(new Bullet(ship));

  }

  if(wIsPressed == true && spaceIsPressed == true)
  {
   ship.accelerate(.1);
    ship.setForward(true);
    bull.add(new Bullet(ship));

  }

  if(sIsPressed == true && spaceIsPressed == true)
  {
    ship.declerate(.1);
    ship.setBackward(true);
    bull.add(new Bullet(ship));

  }

  if(rIsPressed==true && loser==true){
    redraw();
  }


  if(key == 'r'){
   rIsPressed=true;

  }


  if(key == 'w' ){
    ship.accelerate(.1);
    ship.setForward(true);
    wIsPressed=true;
  }
  else{
    ship.setForward(false);
  }
  
  if(key == 's' ){
    ship.declerate(.1);
    ship.setBackward(true);
    sIsPressed=true;
  }
  else{
    ship.setBackward(false);
  }
 
//rotate to right
  if(key == 'd'){
    ship.rotate(5);
    dIsPressed=true;
  }
  

//rotate to left
  if(key == 'a'){
    ship.rotate(-5);
    aIsPressed=true;
  }

  if(key == ' '){
    bull.add(new Bullet(ship));
    spaceIsPressed=true;
  }

if (key == CODED) {
  if(keyCode == RIGHT){
    ship.rotate(5);
    dIsPressed=true;
  }
  if(keyCode == LEFT){
    ship.rotate(-5);
    aIsPressed=true;
  }


  }

  if(key == 'f'){
    ship.setX((int)(Math.random()*500));
    ship.setY((int)(Math.random()*500));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection((int)(Math.random()*360));
  }

//automatic hyperspace
  if(ship.getDirectionX() >100 || ship.getDirectionY() >100){
    ship.setX(500);
    ship.setX(500);
    ship.setDirectionX(0);
    ship.setDirectionY(0);
  }

}

public void keyReleased(){
  if(key=='a')
  {
    aIsPressed = false;
  }
  else if (key == 'w')
  {
    wIsPressed = false;
    ship.setForward(false);
  }

  if(key=='s')
  {
    sIsPressed = false;
    ship.setBackward(false);
  }
  else if (key == 'd')
  {
    dIsPressed = false;
  }
if(key==' '){
  spaceIsPressed=false;
}
if(key == 'r'){
  rIsPressed=true;
}else{
  rIsPressed=false;
}
  if (key == CODED) {
  if(keyCode == RIGHT){
    dIsPressed=false;
  }
  if(keyCode == LEFT){
    ship.rotate(-5);
    aIsPressed=false;
  }
  }
}




class SpaceShip extends Floater  
{   

  private int lines1;
  private int[] xLines1;   
  private int[] yLines1;  
  private int lines2;
  private int[] xLines2;   
  private int[] yLines2;
  private int lines3;
  private int[] xLines3;   
  private int[] yLines3;
  private int lines4;
  private int[] xLines4;   
  private int[] yLines4;
  private boolean isForward;
  private boolean isBackwards;

    SpaceShip(){
      myRed=255;
      myGreen=0;
      myBlue=0;

      //corners for spaceship
      corners=12;
      xCorners = new int[corners];
      yCorners = new int[corners];

      xCorners[0]=36/2;
      yCorners[0]=0/2;

      xCorners[1]=16/2;
      yCorners[1]=8/2;

      xCorners[2]=28/2;
      yCorners[2]=12/2;

      xCorners[3]=-8/2;
      yCorners[3]=16/2;

      xCorners[4]=-24/2;
      yCorners[4]=20/2;

      xCorners[5]=-12/2;
      yCorners[5]=4/2;

      xCorners[6]=-8/2;
      yCorners[6]=0/2;

      xCorners[7]=-12/2;
      yCorners[7]=-8/2;

      xCorners[8]=-24/2;
      yCorners[8]=-20/2;

      xCorners[9]=-8/2;
      yCorners[9]=-16/2;

      xCorners[10]=28/2;
      yCorners[10]=-12/2;

      xCorners[11]=16/2;
      yCorners[11]=-8/2;


      //rockets for spaceship
      //forard rockets
      lines1=7;

      xLines1 = new int[lines1];
      yLines1 = new int[lines1];

      xLines1[0]=-20/2;
      yLines1[0]= 12/2;

      xLines1[1]=-20/2;
      yLines1[1]= 8/2;

      xLines1[2]=-20/2;
      yLines1[2]= 4/2;

      xLines1[3]=-20/2;
      yLines1[3]= 0/2;

      xLines1[4]=-20/2;
      yLines1[4]= -4/2;

      xLines1[5]=-20/2;
      yLines1[5]= -8/2;

      xLines1[6]=-20/2;
      yLines1[6]= -12/2;

      lines2=7;

      xLines2 = new int[lines2];
      yLines2 = new int[lines2];

      xLines2[0]=-28/2;
      yLines2[0]= 12/2;

      xLines2[1]=-28/2;
      yLines2[1]= 8/2;

      xLines2[2]=-28/2;
      yLines2[2]= 4/2;

      xLines2[3]=-28/2;
      yLines2[3]= 0/2;

      xLines2[4]=-28/2;
      yLines2[4]= -4/2;

      xLines2[5]=-28/2;
      yLines2[5]= -8/2;

      xLines2[6]=-28/2;
      yLines2[6]= -12/2;

//backward rockets
      lines3=7;

      xLines3 = new int[lines3];
      yLines3 = new int[lines3];

      xLines3[0]=42/2;
      yLines3[0]= 8/2;

      xLines3[1]=42/2;
      yLines3[1]= 4/2;

      xLines3[2]= 42/2;
      yLines3[2]= 0/2;

      xLines3[3]= 42/2;
      yLines3[3]= -4/2;

      xLines3[4]=42/2;
      yLines3[4]= -8/2;

      xLines3[5]=42/2;
      yLines3[5]= 12/2;

      xLines3[6]=42/2;
      yLines3[6]= -12/2;

      lines4=7;

      xLines4 = new int[lines4];
      yLines4 = new int[lines4];

      xLines4[0]=48/2;
      yLines4[0]= 8/2;

      xLines4[1]=48/2;
      yLines4[1]= 4/2;

      xLines4[2]= 48/2;
      yLines4[2]= 0/2;

      xLines4[3]= 48/2;
      yLines4[3]= -4/2;

      xLines4[4]=48/2;
      yLines4[4]= -8/2;

      xLines4[5]=48/2;
      yLines4[5]= 12/2;

      xLines4[6]=48/2;
      yLines4[6]= -12/2;

//directions,etc.
      myCenterX=250;
      myCenterY=250;

      myDirectionX=0;
      myDirectionY=0;

      myPointDirection=0;

      isForward=false;
      isBackwards=false;
    }

  public void setX(int x){myCenterX=x;}  

  public int getX(){return (int)(myCenterX);}   

  public void setY(int y){myCenterY=y;}   

  public int getY(){return (int)(myCenterY);}   
  
  public void setDirectionX(double x){myDirectionX=x;}

  public double getDirectionX(){ return myDirectionX;}   

  public void setDirectionY(double y){myDirectionY=y;}  

  public double getDirectionY(){return myDirectionY;} 

  public void setPointDirection(int degrees){myPointDirection=degrees;} 

  public double getPointDirection(){return myPointDirection;}

  public boolean getForward(){return isForward;}

  public void setForward(boolean newForward){isForward=newForward;}

  public boolean getBackward(){return isBackwards;}

  public void setBackward(boolean newBackward){isBackwards=newBackward;}

  public int getRed(){return myRed;}

  public void setRed(int newRed){myRed=newRed;}

  public int getGreen(){return myGreen;}

  public void setGreen(int newGreen){myGreen=newGreen;}

  public int getBlue(){return myBlue;}

  public void setBlue(int newBlue){myBlue=newBlue;}

    public void show ()  //Draws the floater at the current position  
  { 

    fill(myRed,myGreen,myBlue);   
    stroke(myRed,myGreen,myBlue);   
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;
    float xLineRotatedTranslated1, yLineRotatedTranslated1, xLineRotatedTranslated2, yLineRotatedTranslated2,xLineRotatedTranslated3, yLineRotatedTranslated3,xLineRotatedTranslated4, yLineRotatedTranslated4;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);

    if(isForward==true){
       for(int nI = 0; nI < lines1; nI++)    
    {     
      //rotate and translate the coordinates of the forward rockets using current direction 
      xLineRotatedTranslated1 = (float)((xLines1[nI]* Math.cos(dRadians)) - (yLines1[nI] * Math.sin(dRadians))+myCenterX);     
      yLineRotatedTranslated1 = (float)((xLines1[nI]* Math.sin(dRadians)) + (yLines1[nI] * Math.cos(dRadians))+myCenterY);      
    
      xLineRotatedTranslated2 = (float)((xLines2[nI]* Math.cos(dRadians)) - (yLines2[nI] * Math.sin(dRadians))+myCenterX);     
      yLineRotatedTranslated2 = (float)((xLines2[nI]* Math.sin(dRadians)) + (yLines2[nI] * Math.cos(dRadians))+myCenterY); 
      stroke(255, 0, 0);
      strokeWeight(2);
      line(xLineRotatedTranslated1, yLineRotatedTranslated1, xLineRotatedTranslated2, yLineRotatedTranslated2);  

    }  
    }
    if(isBackwards==true){
       for(int nI = 0; nI < lines3; nI++)    
    {     
      //rotate and translate the coordinates of the bckward rockets using current direction 
      xLineRotatedTranslated3 = (float)((xLines3[nI]* Math.cos(dRadians)) - (yLines3[nI] * Math.sin(dRadians))+myCenterX);     
      yLineRotatedTranslated3 = (float)((xLines3[nI]* Math.sin(dRadians)) + (yLines3[nI] * Math.cos(dRadians))+myCenterY);      
    
      xLineRotatedTranslated4 = (float)((xLines4[nI]* Math.cos(dRadians)) - (yLines4[nI] * Math.sin(dRadians))+myCenterX);     
      yLineRotatedTranslated4 = (float)((xLines4[nI]* Math.sin(dRadians)) + (yLines4[nI] * Math.cos(dRadians))+myCenterY); 
      stroke(255, 0, 0);
      strokeWeight(2);
      line(xLineRotatedTranslated3, yLineRotatedTranslated3, xLineRotatedTranslated4, yLineRotatedTranslated4);  
    }  
   
    }  
  }

  }   


class Asteroids extends Floater{

private int rotSpeed;
  
 public void setX(int x){myCenterX=x;}  

  public int getX(){return (int)(myCenterX);}   

  public void setY(int y){myCenterY=y;}   

  public int getY(){return (int)(myCenterY);}   
  
  public void setDirectionX(double x){myDirectionX=x;}

  public double getDirectionX(){ return myDirectionX;}   

  public void setDirectionY(double y){myDirectionY=y;}  

  public double getDirectionY(){return myDirectionY;} 

  public void setPointDirection(int degrees){myPointDirection=degrees;} 

  public double getPointDirection(){return myPointDirection;}

  public int getRed(){return myRed;}

  public void setRed(int newRed){myRed=newRed;}

  public int getGreen(){return myGreen;}

  public void setGreen(int newGreen){myGreen=newGreen;}

  public int getBlue(){return myBlue;}

  public void setBlue(int newBlue){myBlue=newBlue;}

  Asteroids(){

    myRed=100;
    myGreen=100;
    myBlue=100;

    corners=8;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0]=28/2;
    yCorners[0]=0/2;

    xCorners[1]=20/2;
    yCorners[1]=24/2;

    xCorners[2]=0/2;
    yCorners[2]=32/2;

    xCorners[3]=-16/2;
    yCorners[3]=16/2;

    xCorners[4]=-20/2;
    yCorners[4]=-8/2;

    xCorners[5]=-8/2;
    yCorners[5]=-32/2;

    xCorners[6]=8/2;
    yCorners[6]=-16/2;

    xCorners[7]=24/2;
    yCorners[7]=-20/2;

    myCenterX=(double)(Math.random()*500);
    myCenterY=(double)(Math.random()*500);
    

    myDirectionX=(double)(Math.random()*2)-1;
    myDirectionY=(double)(Math.random()*2)-1;

    myPointDirection=(int)(Math.random()*360);

    rotSpeed=(int)(Math.random()*10-5);
  }

  public void move ()   //move the floater in the current direction of travel
  {      
    rotate(rotSpeed);
    super.move();   
}

}
class Bullet extends Floater{

 double dRadians;

  Bullet(SpaceShip theShip){
    myCenterX=theShip.getX();
    myCenterY=theShip.getY();
    myPointDirection=theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);   
    myDirectionX=5*Math.cos(dRadians) + myDirectionX;
    myDirectionY=5*Math.sin(dRadians) + myDirectionY;
    myRed=255;
    myGreen=0;
    myBlue=0;
  }

public void setX(int x){myCenterX=x;}  

  public int getX(){return (int)(myCenterX);}   

  public void setY(int y){myCenterY=y;}      

  public int getY(){return (int)(myCenterY);}   
  
  public void setDirectionX(double x){myDirectionX=x;}

  public double getDirectionX(){ return myDirectionX;}   

  public void setDirectionY(double y){myDirectionY=y;}  

  public double getDirectionY(){return myDirectionY;} 
 
  public void setPointDirection(int degrees){myPointDirection=degrees;} 

  public double getPointDirection(){return myPointDirection;}

  public int getRed(){return myRed;}

  public void setRed(int newRed){myRed=newRed;}

  public int getGreen(){return myGreen;}

  public void setGreen(int newGreen){myGreen=newGreen;}

  public int getBlue(){return myBlue;}

  public void setBlue(int newBlue){myBlue=newBlue;}

  public void show ()  //Draws the floater at the current position  
  {             
    fill(myRed,myGreen,myBlue);   
    stroke(myRed,myGreen,myBlue);    
    //convert degrees to radians for sin and cos                       
    ellipse((float)myCenterX, (float)myCenterY, (float)5,(float)5);

  
  }

   public void move ()   //move the floater in the current direction of travel
  {      
    
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    /*//wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height; 
      }  
      */ 
    }   
  }      


class BossAsteroid extends Asteroids{

  private int hits;

  BossAsteroid(){
    hits =0;

    myRed=100;
    myGreen=100;
    myBlue=100;

    corners=8;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0]=28*4;
    yCorners[0]=0*4;

    xCorners[1]=20*4;
    yCorners[1]=24*4;

    xCorners[2]=0*4;
    yCorners[2]=32*4;

    xCorners[3]=-16*4;
    yCorners[3]=16*4;

    xCorners[4]=-20*4;
    yCorners[4]=-8*4;

    xCorners[5]=-8*4;
    yCorners[5]=-32*4;

    xCorners[6]=8*4;
    yCorners[6]=-16*4;

    xCorners[7]=24*4;
    yCorners[7]=-20*4;
}

public int getHits(){
  return hits;
}

public void setHits(int daHits){
  hits = daHits;
}

public void addHits(){
  hits++;
}
}


class Star
{
  private int myX, myY;
  public Star(){
      myX = (int)(Math.random()*500);
      myY = (int)(Math.random()*500);
  }
  public void show(){
    fill(255);
    noStroke();
    ellipse(myX, myY, 2, 2);
  }

}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners; 
  protected int myRed;
  protected int myGreen;
  protected int myBlue;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees  
 
  
  abstract public void setX(int x);

  abstract public int getX();

  abstract public void setY(int y);

  abstract public int getY();   
  
  abstract public void setDirectionX(double x);

  abstract public double getDirectionX(); 

  abstract public void setDirectionY(double y);  

  abstract public double getDirectionY();

  abstract public void setPointDirection(int degrees); 

  abstract public double getPointDirection();

   abstract public int getRed();

  abstract public void setRed(int newRed);

 abstract public int getGreen();

  abstract public void setGreen(int newGreen);

  abstract public int getBlue();

  abstract public void setBlue(int newBlue);

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void declerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX -= ((dAmount) * Math.cos(dRadians));    
    myDirectionY -= ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myRed,myGreen,myBlue);   
    stroke(myRed,myGreen,myBlue);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);

  
  }   
} 

