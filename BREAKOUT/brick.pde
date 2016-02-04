class Brick
{
  //declaring variables
  float x;
  float y;
  
  int Bwidth;
  int Bheight;
  int Bradius;
  
  int bricklife;
  color redbrick,bluebrick,greenbrick;
  
  Brick()
  {
    bricklife = 3;
    Bwidth = 75;
    Bheight = 20;
    
    redbrick = color(255,0,0);
    bluebrick = color(0,0,255);
    greenbrick = color(0,255,0);
  }
  
 
  void display()
  {
    //display the corresponding bricks depending on the brick life
    switch(bricklife)
    {
      case 1:
        fill(redbrick);
        stroke(255);
        rect(x, y, Bwidth, Bheight);
      break;

      case 2:
      fill(bluebrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;

      case 3:
      fill(greenbrick);
      stroke(255);
      rect(x, y, Bwidth, Bheight);
      break;
    }
  }
  
  //position of 1 brick
  void BrickPosition(float x,float y)
  {
    this.x = x;
    this.y = y;
  }
  
  //method to initialize brick lifes;
  void BrickLife(int Blife)
  {
    bricklife = Blife;
  }
  
  int GetBrickLife()
  {
    return bricklife;
  }
  
  boolean intersect(Ball ball)
  {
    //width position of a brick
    float Brickleft = x;
    float Brickright = x + Bwidth;
    
    //checks if the ball is in the same y axis as the brick
    if( (ball.y + ball.radius >= Bheight) && (ball.y + ball.radius) <= (y + Bheight))
    {
      //checks if the ball axis is on the brick
      if( (ball.x >= Brickleft) && (ball.x <= Brickright) )
      {
        //meaning it hit
        return true;
      }
      else
      {
        //it didnt hit the brick
        return false;
      }
    }
    else
    {
      //it hasnt hit anything
      return false;
    }
  }
}
