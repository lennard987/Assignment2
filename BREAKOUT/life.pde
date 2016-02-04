class Life 
{
  Paddle paddle;
  PImage heart;
  int hsize;
  
  Life(Paddle paddle)
  {
    this.paddle = paddle;
    heart = loadImage("life.png");
    hsize = 40;
  }
  
  int currentlife()
  {
    return paddle.getlife();
  }
  
  void draw()
  {
    for (int i = 0; i < currentlife(); i++ )
    {
      float x = hsize * i;
      float y = 5;
      
      image(heart,x,y,hsize,hsize);
    }
  }
}
