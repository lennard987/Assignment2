class Brick
{
  //declaring variables
  float x;
  float y;

  int level;
  int Bwidth;
  int Bheight;
  int Bradius;


  int bricklife;
  PImage life1,life2,life3,life4,life5;

  Brick()
  {
    bricklife = 3;
    Bwidth = 75;
    Bheight = 20;
    Bradius = 5;

    life1 = loadImage("life1.png");
    life2 = loadImage("life2.png");
    life3 = loadImage("life3.png");
    life4 = loadImage("life4.png");
    life5 = loadImage("life5.png");
    
  }


  void display()
  {
    //display the corresponding bricks depending on the brick life
    switch(bricklife)
    {
    case 1:
      image(life1,x, y, Bwidth, Bheight);
      break;

    case 2:
      image(life2,x, y, Bwidth, Bheight);
      break;

    case 3:
      image(life3,x, y, Bwidth, Bheight);
      break;

    case 4:
      image(life4,x, y, Bwidth, Bheight);
      break;
     case 5:
      image(life5,x, y, Bwidth, Bheight);
      break;
    }
  
  }

  //position of 1 brick
  void BrickPosition(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  //method to initialize brick lifes;
  void BrickLife(int Blife)
  {
    bricklife = Blife;
  }

  int GetBrickLife()
  {
    return bricklife;
  }

  boolean intersect(Ball ball)
  {
    //width position of a brick
    float Brickleft = x;
    float Brickright = x + Bwidth;
    float Bricktop = y;
    float Brickbottom = y + Bheight;

    //if it hit bottom
    if ( ball.y - ball.radius < Brickbottom && ball.x > Brickleft && ball.x < Brickright && ball.y - ball.radius > Bricktop )
    {
      ball.y = Brickbottom + ball.radius;
      return true;
    }

    //if it hit top
    if ( ball.y + ball.radius > Bricktop && ball.x > Brickleft && ball.x < ball.radius && ball.y + ball.radius < Brickbottom)
    {
      ball.y = Brickleft - ball.radius;
      ball.yspeed = -ball.yspeed;
      return true;
    }

    //if hit right

    if ( ball.x - ball.radius < Brickright && ball.x - ball.radius > Brickleft && ball.y > Bricktop && ball.y < Brickbottom)
    {
      ball.x = Brickright - ball.radius;
      ball.xspeed = 5.0f;
      ball.yspeed = 5.0f;
      return true;
    }

    //hit  left
    if ( ball.x + ball.radius > Brickleft && ball.x + ball.radius < Brickleft && ball.y > Bricktop && ball.y < Brickbottom)
    {
      ball.x = Brickleft - ball.radius;
      ball.xspeed = -5.0f;
      ball.yspeed = 5.0f;
      return true;
    } else
    {
      return false;
    }
  }
}

