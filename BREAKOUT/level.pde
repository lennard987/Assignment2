class Level
{
  float radius;
  int level;
  
  Level()
  {
    level = 1;
     radius = 20;
  }

  void display()
  {
    textSize(25);
    stroke(255);
    text("level - ",90,30);
    for( int i = 0; i < 5; i++ )
    {
      float x = 100 + 25 * i;
      float y = 22.5;

      fill(128,128,128);
      noStroke();
      ellipse(x,y,radius,radius);
    }
    for (int i = 0; i < level; i++)
    {

      float x = 100 + 25 * i;
      float y = 22.5;

      fill(255,255,0);
      noStroke();
      ellipse(x,y,radius,radius);
    }
    stroke(255);
  line(220,0,220,45);
  }
  
  
}

