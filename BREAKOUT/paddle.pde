class Paddle
{
  //declaring variables
  PImage paddle;
  float x;
  float y;
  
  //paddle 
  int Pwidth;
  int Pheight;
  int Pradius;
  
  //stats
  int score;
  int life;
  
  Paddle()
  {
    //paddle position
    x = width / 2;
    y = height - 30;
    
    Pwidth = 75;
    Pheight = 15;
    Pradius = 5;
    
    life = 3;
    score =0;
    
    paddle = loadImage("paddle.png");
  }
  
  void display()
  {
    noStroke();
    wallcollision();
    image(paddle,x,y,Pwidth,Pheight);
  }
  
  void wallcollision()
  {
     if( x + Pwidth >= width )
     {
       x = width - Pwidth;
     } 
     if( x <= 0 )
     {
       x = 0;
     }
  }
  
  //update the paddle
  void PaddlePosition(float x,float y)
  {
    this.x = x;
    this.y = y;
  }
}
