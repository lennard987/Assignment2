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
    x = width/2;
    y = height/2;
    xspeed = -5;
    yspeed = 5;
    radius = 5;
    Bcolor = color(255);
  }
  
  //display 
  void display()
  {

      stroke(0);
      fill(Bcolor);
      ellipse(x,y,radius*2,radius*2);

  }
  
  //ball movement
  void move()
  {
    x += xspeed;
    y += yspeed;
    
    //checks collision with the wall
    if( (x > width) || ( x < 0 ) )
    {
      xspeed *= -1;
    }
    
    //check the collision with the top wall
    if( y < 0 )
    {
      yspeed *= -1;
    }
    
    //check if the ball hits the ground, lose a life
    if( y > height - 30 )
    {
      BREAKOUT.gamestate = 2;
      paddle.life--;
      ball.xspeed = 0;
      ball.yspeed = 0;
      Bcolor = color(0);
      
    }
  }
  
  void reset()
  {
    paddle.PaddlePosition(width/2, height - 30);
    ball.xspeed = -5;
    ball.yspeed = 5;
    Bcolor = color(255);
    x = width/2;
    y = height/2;
  }
  
}
