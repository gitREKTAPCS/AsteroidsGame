//your variable declarations here
SpaceShip tomatillo = new SpaceShip();
Star rhinohippomachine[] = new Star[500];
Asteroids johnCena[] = new Asteroids[7];

public void setup() 
{
  size(1000, 1000);
  for(int i =0; i<rhinohippomachine.length; i++){
  rhinohippomachine[i] = new Star();
}

  for(int i=0; i<johnCena.length;i++){
    johnCena[i] = new Asteroids();
  }

}
public void draw() 
{
  background(0);
  tomatillo.move();
  tomatillo.show();
   for(int i =0; i<johnCena.length; i++){
  johnCena[i].move();
  johnCena[i].show();
}
  for(int i =0; i<rhinohippomachine.length; i++){
  rhinohippomachine[i].show();
}


 
}

public void keyPressed(){

  //acclerate + decelerate with limits
  if(key == 'w' ){
    tomatillo.accelerate(.1);
    tomatillo.setForward(true);
  }
  else{
    tomatillo.setForward(false);
  }
  
 
 
  if(key == 's' ){
    tomatillo.declerate(.1);
    tomatillo.setBackward(true);
  }
  else{
    tomatillo.setBackward(false);
  }
 

//rotate to right
  if(key == 'd'){
    tomatillo.rotate(5);
  }
  

//rotate to left
  if(key == 'a'){
    tomatillo.rotate(-5);
  }

 if (key == CODED) {
  if(keyCode == RIGHT){
    tomatillo.rotate(5);
  }
  if(keyCode == LEFT){
    tomatillo.rotate(-5);
  }
  }

  if(key == 'f'){
    tomatillo.setX(500);
    tomatillo.setX(500);
    tomatillo.setDirectionX(0);
    tomatillo.setDirectionY(0);
  }

//automatic hyperspace
  if(tomatillo.getDirectionX() >100 || tomatillo.getDirectionY() >100){
    tomatillo.setX(500);
    tomatillo.setX(500);
    tomatillo.setDirectionX(0);
    tomatillo.setDirectionY(0);
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
      myColor=255;

      //corners for spaceship
      corners=12;
      xCorners = new int[corners];
      yCorners = new int[corners];

      xCorners[0]=36;
      yCorners[0]=0;

      xCorners[1]=16;
      yCorners[1]=8;

      xCorners[2]=28;
      yCorners[2]=12;

      xCorners[3]=-8;
      yCorners[3]=16;

      xCorners[4]=-24;
      yCorners[4]=20;

      xCorners[5]=-12;
      yCorners[5]=4;

      xCorners[6]=-8;
      yCorners[6]=0;

      xCorners[7]=-12;
      yCorners[7]=-8;

      xCorners[8]=-24;
      yCorners[8]=-20;

      xCorners[9]=-8;
      yCorners[9]=-16;

      xCorners[10]=28;
      yCorners[10]=-12;

      xCorners[11]=16;
      yCorners[11]=-8;


      //rockets for spaceship
      //forard rockets
      lines1=7;

      xLines1 = new int[lines1];
      yLines1 = new int[lines1];

      xLines1[0]=-20;
      yLines1[0]= 12;

      xLines1[1]=-20;
      yLines1[1]= 8;

      xLines1[2]=-20;
      yLines1[2]= 4;

      xLines1[3]=-20;
      yLines1[3]= 0;

      xLines1[4]=-20;
      yLines1[4]= -4;

      xLines1[5]=-20;
      yLines1[5]= -8;

      xLines1[6]=-20;
      yLines1[6]= -12;

      lines2=7;

      xLines2 = new int[lines2];
      yLines2 = new int[lines2];

      xLines2[0]=-28;
      yLines2[0]= 12;

      xLines2[1]=-28;
      yLines2[1]= 8;

      xLines2[2]=-28;
      yLines2[2]= 4;

      xLines2[3]=-28;
      yLines2[3]= 0;

      xLines2[4]=-28;
      yLines2[4]= -4;

      xLines2[5]=-28;
      yLines2[5]= -8;

      xLines2[6]=-28;
      yLines2[6]= -12;

//backward rockets
      lines3=7;

      xLines3 = new int[lines3];
      yLines3 = new int[lines3];

      xLines3[0]=42;
      yLines3[0]= 8;

      xLines3[1]=42;
      yLines3[1]= 4;

      xLines3[2]= 42;
      yLines3[2]= 0;

      xLines3[3]= 42;
      yLines3[3]= -4;

      xLines3[4]=42;
      yLines3[4]= -8;

      xLines3[5]=42;
      yLines3[5]= 12;

      xLines3[6]=42;
      yLines3[6]= -12;

      lines4=7;

      xLines4 = new int[lines4];
      yLines4 = new int[lines4];

      xLines4[0]=48;
      yLines4[0]= 8;

      xLines4[1]=48;
      yLines4[1]= 4;

      xLines4[2]= 48;
      yLines4[2]= 0;

      xLines4[3]= 48;
      yLines4[3]= -4;

      xLines4[4]=48;
      yLines4[4]= -8;

      xLines4[5]=48;
      yLines4[5]= 12;

      xLines4[6]=48;
      yLines4[6]= -12;

//directions,etc.
      myCenterX=500;
      myCenterY=500;

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

    public void show ()  //Draws the floater at the current position  
  { 

    fill(myColor);   
    stroke(myColor);    
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
      stroke(0,255,255);
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

  Asteroids(){

    myColor=255;

    corners=8;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0]=28;
    yCorners[0]=0;

    xCorners[1]=20;
    yCorners[1]=24;

    xCorners[2]=0;
    yCorners[2]=32;

    xCorners[3]=-16;
    yCorners[3]=16;

    xCorners[4]=-20;
    yCorners[4]=-8;

    xCorners[5]=-8;
    yCorners[5]=-32;

    xCorners[6]=8;
    yCorners[6]=-16;

    xCorners[7]=24;
    yCorners[7]=-20;

    myCenterX=(double)(Math.random()*1000);
    myCenterY=(double)(Math.random()*1000);
    

    myDirectionX=(double)(Math.random()*2.5);
    myDirectionY=(double)(Math.random()*2.5);

    myPointDirection=(int)(Math.random()*360);

    rotSpeed=(int)(Math.random()*10-5);
  }

  public void move ()   //move the floater in the current direction of travel
  {      
    rotate(rotSpeed);
    super.move();   
}

}

class Star
{
  private int myX, myY;
  public Star(){
      myX = (int)(Math.random()*1000);
      myY = (int)(Math.random()*1000);
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
  protected int myColor;   
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
    fill(myColor);   
    stroke(myColor);    
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

