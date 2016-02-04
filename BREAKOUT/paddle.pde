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
    image(paddle, x, y, Pwidth, Pheight);
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
}


