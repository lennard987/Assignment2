class Ball
{
  //declaring variables
  float x;
  float y;

  float xspeed;
  float yspeed;

  float radius;

  color Bcolor;


  //initializing the ball
  Ball()
  {
    xspeed = 5;
    yspeed = -5;
    radius = 7.5;
    Bcolor = color(255);
  }

  //display 
  void display()
  {

    stroke(0);
    fill(Bcolor);
    ellipse(x, y, radius*2, radius*2);

    //paddle collision
    if ( paddle.intersect(ball))
    {
      ball.yspeed = -abs(ball.yspeed);
      ball.xspeed = -(paddle.x + paddle.Pwidth/2 - ball.x)/5;
    }
  }

  //ball movement
  void move()
  {
    x += xspeed;
    y += yspeed;

    //checks collision with the wall
    if ( (x > width) || ( x < 0 ) )
    {
      xspeed *= -1;
    }

    //check the collision with the top wall
    if ( y - radius < 45 )
    {
      yspeed *= -1;
    }

    //check if the ball hits the ground, lose a life
    if ( y > height - 15)
    {
      BREAKOUT.gamestate = 3;
      paddle.life--;
      ball.xspeed = 0;
      ball.yspeed = 0;
      Bcolor = color(0);
    }
  }
}
