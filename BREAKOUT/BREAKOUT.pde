//c14337331 - Lennard Bandol 
ArrayList bricks;
Ball ball;
Paddle paddle;
Life playerlife;
Score playerscore;
static int gamestate;
static int level;

void setup()
{
  size(800, 600);
  smooth();
  noCursor();

  level = 1;
  ball = new Ball();
  paddle = new Paddle();
  playerlife = new Life(paddle);
  playerscore = new Score(paddle);
  bricks = new ArrayList();
  initializebricks();
  gamestate = 1;
}

void draw()
{
  background(0);
  gamestate();
}

void initializebricks()
{
  //adding bricks in the array
  //first row 10 bricks
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 70);
    b.BrickLife(level);
    bricks.add(b);
  }
  //second row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 90);
    b.BrickLife(level);
    bricks.add(b);
  }

  //third row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 110);
    b.BrickLife(level);
    bricks.add(b);
  }

  //fourth row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 130);
    b.BrickLife(level);
    bricks.add(b);
  }
  //fifth row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 150);
    b.BrickLife(level);
    bricks.add(b);
  }
  //sixth row
  for ( int i = 0; i < 10; i++ )
  {
    Brick b = new Brick();
    b.BrickPosition( (75*i) + 25, 170);
    b.BrickLife(level);
    bricks.add(b);
  }
}

void displaybricks()
{
  for (int i = 0; i < bricks.size (); i++)
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

  //menu state
  if (gamestate == 1)
  {
    menu();
  }
  
  //ingame state
  if (gamestate == 2)
  {
    displaygame();
  }
  
  //lose life staet
  if( gamestate == 3)
  {
    line(0, height-30, width, height-30);
    line(0, 45, width, 45);
    paddle.control();
    paddle.display();
    paddle.control();
    ball.display();
    playerlife.draw();
    playerscore.draw();
    displaybricks();
    fill(255);
    textAlign(CENTER);
    text("Press spacebar to continue!", width/2, height/2);
    ball.Bcolor = color(255);
    ball.x = paddle.x + paddle.Pwidth/2;
    ball.y = paddle.y;  

    if (keyPressed)
    {
      if ( key == ' ')
      {
        gamestate = 2;
        ball.xspeed = 5;
        ball.yspeed = -5;
      }
    }
    
    if(paddle.life == 0)
    {
      gamestate = 4;
    }
  }
  
  //game over state
  if(gamestate == 4)
  {
    gameover();
  }
}

void menu()
{
  cursor();
  noStroke();
  textAlign(CENTER);
  textSize(25);
  float Rheight = height*0.15;
  float Rwidth = width*0.5;
  color Rcolor = color(255);
  color Tcolor = color(0);
  //play
  fill(Rcolor);
  rect(width*0.25, height*0.2, Rwidth, Rheight, 25);
  fill(Tcolor);
  text("PLAY", width*0.5, height*0.30);
  //highscore
  fill(Rcolor);
  rect(width*0.25, height*0.4, Rwidth, Rheight, 25);
  fill(Tcolor);
  text("Highscore", width*0.5, height*0.50);
  //exit
  fill(Rcolor);
  rect(width*0.25, height*0.6, Rwidth, Rheight, 25);
  fill(Tcolor);
  text("Instruction", width*0.5, height*0.70);

  //first option
  if (mouseX>=width*0.25 && mouseX <= width*0.75)
  {
    if (mouseY>=height*0.2 && mouseY<= height*0.2 + Rheight)
    {
      fill(255, 0, 0);
      rect(width*0.25, height*0.2, width*0.5, height*0.15, 25);
      cursor(HAND);
      fill(0);
      text("PLAY", width*0.5, height*0.30);
      if (mousePressed)
      {
        gamestate = 2;
        ball.Bcolor = color(255);
        ball.x = paddle.x + paddle.Pwidth/2;
        ball.y = paddle.y;  
        noCursor();
      }
    }
  }

  //second option
  if (mouseX>=width*0.25 && mouseX <= width*0.75)
  {
    if (mouseY>=height*0.4 && mouseY<= height*0.4 + Rheight)
    {
      fill(255, 0, 0);
      rect(width*0.25, height*0.4, width*0.5, height*0.15, 25);
      cursor(HAND);
      fill(0);
      text("Highscore", width*0.5, height*0.50);
    }
  }

  //third option
  if (mouseX>=width*0.25 && mouseX <= width*0.75)
  {
    if (mouseY>=height*0.6 && mouseY<= height*0.6 + Rheight)
    {
      fill(255, 0, 0);
      rect(width*0.25, height*0.6, width*0.5, height*0.15, 25);
      cursor(HAND);
      fill(0);
      text("Instruction", width*0.5, height*0.70);
    }
  }
}

//display method
void displaygame()
{
    paddle.control();
    paddle.display();
    paddle.control();
    ball.move();
    ball.display();
    playerlife.draw();
    playerscore.draw();
    displaybricks();
    stroke(255);
    line(0, height-30, width, height-30);
    line(0, 45, width, 45);
    if ( paddle.intersect(ball))
    {
      ball.yspeed = -abs(ball.yspeed);
      ball.xspeed = -(paddle.x + paddle.Pwidth/2 - ball.x)/5;
    }
}

void gameover()
{
  fill(255);
   textAlign(CENTER);
   text("Game Over! ", width/2, height*0.2);
   text("Score:" + paddle.score, width/2, height*0.3);
   
   
   fill(255);
    textAlign(CENTER);
    text("Press spacebar to go back to menu", width/2, height*0.5);
    
   
    if (keyPressed)
    {
      if ( key == ' ')
      {
        //restart the score;
        level = 0;
        ball = new Ball();
        paddle = new Paddle();
        playerlife = new Life(paddle);
        playerscore = new Score(paddle);
        bricks = new ArrayList();
        initializebricks();
        gamestate = 1;
      }
    }
}

