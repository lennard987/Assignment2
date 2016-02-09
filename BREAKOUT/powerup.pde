class Powerup
{
  int largepaddlelife;
  int largeballlife;
  
  Powerup()
  {
    largepaddlelife = 3;
    largeballlife = 3;
  }
  
  void largepaddle()
  {
    if (keyPressed)
    {
      if ( key == 'q' || key == 'Q')
      {
        if( largepaddlelife >= 1 )
        {
         paddle.Pwidth = 125;
          largepaddlelife--; 
        }
      }
    }
  }
  
  void largeball()
  {
    if (keyPressed)
    {
      if ( key == 'w' || key == 'W')
      {
        if( largeballlife >= 1 )
        {
         ball.radius = 15;
         largeballlife--; 
         ball.colour
        }
      }
    }
  }
  
  void display()
  {
    largepaddle();
    largeball();
  }
}

