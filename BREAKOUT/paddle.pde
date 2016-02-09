class Paddle
{
  //declaring variables
  float x;
  float y;

  //paddle 
  int Pwidth;
  int Pheight;
  int Pradius;
  int Pspeed;
  color Pcolor;

  //stats
  int score;
  int scoreadd;
  int life;

  Paddle()
  {
    //paddle position
    x = width / 2;
    y = height - 30;

    scoreadd = 20;
    Pwidth = 75;
    Pheight = 15;
    Pradius = 10;
    Pspeed = 7;
    Pcolor = color(255);
    life = 3;
    score =0;
  }

  void display()
  {
    noStroke();
    wallcollision();
    fill(Pcolor);
    rect(x, y, Pwidth, Pheight,Pradius);
  }

  void wallcollision()
  {
    if ( x + Pwidth >= width )
    {
      x = width - Pwidth;
    } 
    if ( x <= 0 )
    {
      x = 0;
    }
  }

  //update the paddle
  void PaddlePosition(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  //ball and paddle collision
  boolean intersect(Ball ball)
  {
    //coordinate of the left side of the paddle
    float paddleleft = x;
    //coordinate of the right side of the paddle
    float paddleright = x + Pwidth;

    //if the ball Y position is equal with the paddle
    if ( (ball.y + ball.radius) >= y )
    {
      //if the ball is on the range of the paddle 
      if ( (ball.x >= paddleleft) && (ball.x <= paddleright) )
      {
        //meant it hit
        return true;
      } 
      
  
      else
      {
        //player missed
        return false;
      }
    }
    else
    {
      //its airborne 
      return false;
    }
  }
  
  int getlife()
  {
    return life;
  }
  
  int getscore()
  {
    return score;
  }
  
  void moveleft()
   {
     x -= Pspeed;
     
     if(  x < 0 )
     {
       x = 0;
     }
   }
   
   void moveright()
   {
     x += Pspeed;
     
     if( x + Pwidth > width)
     {
       x = width - Pwidth;
     }
   }
   
   void control()
   {
     if(keyPressed)
    {
      if(keyCode == LEFT)
      {
        moveleft();
      }
      
      if(keyCode == RIGHT)
      {
        moveright();
      }
    } 
   }
}


