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
  color redbrick, bluebrick, greenbrick, graybrick;

  Brick()
  {
    bricklife = 3;
    Bwidth = 75;
    Bheight = 20;
    Bradius = 5;

    redbrick = color(255, 0, 0);
    bluebrick = color(0, 0, 255);
    greenbrick = color(0, 255, 0);
    graybrick = color(96, 96, 96);
  }


  void display()
  {
    //display the corresponding bricks depending on the brick life
    switch(bricklife)
    {
    case 1:
      fill(redbrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;

    case 2:
      fill(bluebrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;

    case 3:
      fill(greenbrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;

    case 4:
      fill(graybrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;
    }

    fill(255);
    text("level " + BREAKOUT.level, width/2+ 35, 35);
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
      return true;
    }

    //hit  left
    if ( ball.x + ball.radius > Brickleft && ball.x + ball.radius < Brickleft && ball.y > Bricktop && ball.y < Brickbottom)
    {
      ball.x = Brickleft - ball.radius;
      ball.xspeed = -5.0f;
      return true;
    } else
    {
      return false;
    }
  }
}

