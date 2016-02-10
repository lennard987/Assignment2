class Powerup
{
  boolean largepaddle;
  boolean largeball;
  boolean fasterpaddle;
  PImage speedimg;
  color poweron;
  color poweroff;


  Powerup()
  {
    largepaddle = false;
    largeball = false;
    fasterpaddle = false;
    speedimg = loadImage("speed.png");
    poweron = color(255, 0, 0);
    poweroff = color(255);
  }

  void display()
  {
    control();

    //wider paddle icon
    if (largepaddle)
    {
      fill(poweron);
      rect( 360, 15, 50, 15, 5 );
    } else
    {
      fill(poweroff);
      rect( 360, 15, 50, 15, 5 );
    }



    //large ball icon
    if (largeball)
    {
      fill(poweron);
      ellipse(455, 22.5, 25, 25);
    } else
    {
      fill(poweroff);
      ellipse(455, 22.5, 25, 25);
    }

    if (fasterpaddle)
    {
      fill(poweron);
      beginShape();
      {
        stroke(255);
        fill(poweron);
        vertex(500, 7.5);
        vertex(500, 37.5);
        vertex(525, 22.5);
        endShape(CLOSE);
      }

      beginShape();
      {
        vertex(525, 7.5);
        vertex(525, 37.5);
        vertex(550, 22.5);
        endShape(CLOSE);
      }
    } else
    {
      fill(poweroff);
      beginShape();
      {
        stroke(255);
        vertex(500, 7.5);
        vertex(500, 37.5);
        vertex(525, 22.5);
        endShape(CLOSE);
      }

      beginShape();
      {
        vertex(525, 7.5);
        vertex(525, 37.5);
        vertex(550, 22.5);
        endShape(CLOSE);
      }
    }
    fill(255);
    //speed icon

    //divider
    stroke(255);
    line(420, 0, 420, 45);
    line(490, 0, 490, 45);
    line(560, 0, 560, 45);
  }

  void control()
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
            paddle.scoreadd -= 5;
          }
        }
      }
    } else
    {
      if (keyPressed)
      {
        if ( key == 'q' || key == 'Q')
        {
          largepaddle = false;

          if ( !largepaddle  )
          {
            paddle.Pwidth = 75;
             paddle.scoreadd += 5;
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
           paddle.scoreadd -= 5;
        }
      }
    }
  }
  else
  {
    if (keyPressed)
    {
      if ( key == 'w' || key == 'W')
      {
        largeball = false;
        if ( !largeball )
        {
          ball.radius = 7.5;
           paddle.scoreadd += 5;
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
        fasterpaddle = true;
        if( fasterpaddle )
        {
        paddle.Pspeed = 15;
         paddle.scoreadd -= 5;
        }
      }
    }
  }
  else
  {
     if ( keyPressed)
    {
      if ( key == 'E' || key == 'e')
      {
        fasterpaddle = false;
        if( !fasterpaddle )
        {
          paddle.Pspeed = 8;
           paddle.scoreadd += 5;
        }
      }
    }
  }
}
}
