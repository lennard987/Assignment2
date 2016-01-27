class Ball
{
  //declaring variables
  float x;
  float y;
  
  float xspeed;
  float yspeed;
  
  float radius;
  
  //initializing the ball
  Ball()
  {
    x = width/2;
    y = height/2;
    
    xspeed = -5;
    yspeed = 5;
    
    radius = 5;
  }
  
  //display 
  void display()
  {
    stroke(0);
    fill(255);
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
      paddle.life--;
    }
  }
  
}
