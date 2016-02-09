class Powerup
{
  int largepaddlelife;
  int largeball;
  
  Powerup()
  {
    largepaddlelife = 3;
    largeball = 3;
  }
  
  void largepaddle()
  {
    if (keyPressed)
    {
      if ( key == ' ')
      {
        if( largepaddlelife >= 1 )
        {
         paddle.Pwidth = 125;
          largepaddlelife--; 
        }
      }
    }
  }
  
  void display()
  {
    largepaddle();
  }
}

