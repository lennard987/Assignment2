class Brick
{
  //declaring variables
  float x;
  float y;
  
  int Bwidth;
  int Bheight;
  int Bradius;
  
  int bricklife;
  PImage redbrick,bluebrick,greenbrick;
  
  Brick()
  {
    bricklife = 3;
    Bwidth = 75;
    Bheight = 20;
    
    redbrick = loadImage("redbrick.png");
    bluebrick = loadImage("bluebrick.png");
    greenbrick = loadImage("greenbrick.png");
  }
  
 
  void display()
  {
    //display the corresponding bricks depending on the brick life
    switch(bricklife)
    {
      case 1:
        image(bluebrick, x, y, Bwidth, Bheight);
      break;

      case 2:
      image(bluebrick, x, y, Bwidth, Bheight);
      break;

      case 3:
      image(bluebrick, x, y, Bwidth, Bheight);
      break;

    }
  }
  
}
