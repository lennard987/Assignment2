//c14337331 - Lennard Bandol 
ArrayList bricks;
Ball ball;
Paddle paddle;
Life playerlife;
Score playerscore;
static int gamestate;

void setup()
{
  size(800, 600);
  smooth();
  noCursor();
  
  ball = new Ball();
  paddle = new Paddle();
  playerlife = new Life(paddle);
  playerscore = new Score(paddle);
  bricks = new ArrayList();
  initializebricks();
  gamestate = 0;
}

void draw()
{
  background(0);
  paddle.PaddlePosition(mouseX, height - 30);
  paddle.display();
  ball.move();
  ball.display();
  playerlife.draw();
  playerscore.draw();
  displaybricks();
  gamestate();
  
  if( paddle.intersect(ball))
  {
    ball.yspeed = -abs(ball.yspeed);
  }  
  
}

void initializebricks()
{
  //adding bricks in the array
  //first row 10 bricks
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 70);
    bricks.add(b);
  }
  //second row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 90);
    b.BrickLife(3);
    bricks.add(b);
  }

  //third row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 110);
    b.BrickLife(2);
    bricks.add(b);
  }

  //fourth row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 130);
    b.BrickLife(1);
    bricks.add(b);
  }
  //fifth row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 150);
    b.BrickLife(2);
    bricks.add(b);
  }
  //sixth row
    for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 170);
    b.BrickLife(1);
    bricks.add(b);
  }
}

void displaybricks()
{
  for(int i = 0; i < bricks.size(); i++)
  {
    //display all the bricks
    Brick b = (Brick) bricks.get(i);
    b.display();
    
    //if the ball hits the brick
    if (b.intersect(ball))
    {
      paddle.score+=20;
      //change the ball direction and remove one life
      ball.yspeed *= -1;
      b.bricklife -= 1;
      //if the bricks life hits 0 remove it from the array.
      if (b.GetBrickLife() == 0)
      {
        //remove the brick hitted.
        bricks.remove(b);
      }
    }
  }
}

void gamestate()
{
  if(keyPressed)
  {
    if( key == ' ')
    {
      gamestate = 1;
      ball.reset();
    }
  }
  
  if(gamestate == 2)
  {
    text("Press spacebar if you're ready!",width/1.3,height/2);
  }
  
}
