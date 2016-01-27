class Ball
{
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
  
  void display()
  {
    stroke(0);
    fill(255);
    ellipse(x,y,radius*2,radius*2);
  }
   
}
