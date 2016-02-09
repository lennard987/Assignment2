class Powerup
{
  boolean largepaddle;
  boolean largeball;
  boolean fasterpaddle;

  Powerup()
  {
    largepaddle = false;
    largeball = false;
    fasterpaddle = false;
  }

  void display()
  {
    //larger paddle
    if (!largepaddle)
    {
      if (keyPressed)
      {
        if ( key == 'q' || key == 'Q')
        {
          largepaddle = true;
          
          if ( largepaddle  )
          {
            paddle.Pwidth = 125; 
          }
        }
      }
    }

    //larger ball
    if (!largeball)
    {
      if (keyPressed)
      {
        if ( key == 'w' || key == 'W')
        {
            largeball = true;
          if ( largeball )
          {
            ball.radius = 15;
            ball.Bcolor = color(255, 0, 0);
          
          }
        }
      }
    }


    //faster paddle

    if (!fasterpaddle)
    {
      if ( keyPressed)
      {
        if ( key == 'E' || key == 'e')
        {
          paddle.Pspeed = 15;
          paddle.Pwidth = 75;
          fasterpaddle = true;
        }
      }
    }
  }
}


