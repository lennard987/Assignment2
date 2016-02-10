//c14337331 - Lennard Bandol
ArrayList bricks;
Ball ball;
Paddle paddle;
Life playerlife;
Score playerscore;
Powerup playerpowerup;
Level playerlevel;
Menu gamemenu;
Instruction instruction;
static int gamestate;
static int level = 1;

void setup()
{
  size(750, 600);
  smooth();
  noCursor();
  
  instruction = new Instruction();
  gamemenu = new Menu();
  playerlevel = new Level();
  playerpowerup = new Powerup();
  ball = new Ball();
  paddle = new Paddle();
  playerlife = new Life(paddle);
  playerscore = new Score(paddle);
  bricks = new ArrayList();
  initializebricks(level);
  gamestate = 0;
}

void draw()
{
  background(0);
  gamestate();
}

//gamestate
void gamestate()
{

  //menu state
  if( gamestate == 0)
  {
    gamemenu.display();
  }
  if (gamestate == 1)
  {
    instruction.display();
  }

  //ingame state
  if (gamestate == 2)
  {
    displaygame();
  }

  //lose life staet
  if ( gamestate == 3)
  {
    lostlife();
  }

  //game over state
  if (gamestate == 4)
  {
    gameover();
  }
}

//initialize bricks
void initializebricks(int level)
{
  //adding bricks in the array
   //first row 10 bricks
   for ( int i = 0; i < 10; i++ )
   {
   Brick b = new Brick();
   b.BrickPosition( (75*i), 70);
   b.BrickLife(1+playerlevel.level);
   bricks.add(b);
   }
   //second row
   for ( int i = 0; i < 10; i++ )
   {
   Brick b = new Brick();
   b.BrickPosition( (75*i), 90);
   b.BrickLife(0+playerlevel.level);
   bricks.add(b);
   }
   
   //third row
   for ( int i = 0; i < 10; i++ )
   {
   Brick b = new Brick();
   b.BrickPosition( (75*i), 110);
   b.BrickLife(1+playerlevel.level);
   bricks.add(b);
   }
   
   //fourth row
   for ( int i = 0; i < 10; i++ )
   {
   Brick b = new Brick();
   b.BrickPosition( (75*i), 130);
   b.BrickLife(0+playerlevel.level);
   bricks.add(b);
   }
   //fifth row
   for ( int i = 0; i < 10; i++ )
   {
   Brick b = new Brick();
   b.BrickPosition( (75*i), 150);
   b.BrickLife(1+playerlevel.level);
   bricks.add(b);
   }
}

//display bricks
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
      //change the ball direction and remove one life
      ball.yspeed *= -1;
      b.bricklife -= 1;
      //if the bricks life hits 0 remove it from the array.
      if (b.GetBrickLife() == 0)
      {
        paddle.score+=paddle.scoreadd;
        //remove the brick hitted.
        bricks.remove(b);
      }
    }
    
    //checks if the player wins or move to the next level
  if ( bricks.size() == 0 )
  { 
    {
      nextlevel();
    }
  }
  }
}



//display game
void displaygame()
{
  playerlevel.display();
  paddle.control();
  paddle.display();
  ball.move();
  ball.display();
  playerlife.draw();
  playerscore.draw();
  displaybricks();
  playerpowerup.display();
  stroke(255);
  line(0, height-30, width, height-30);
  line(0, 45, width, 45);
}

//gameover state
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
      level = 1;
      ball = new Ball();
      paddle = new Paddle();
      playerlife = new Life(paddle);
      playerscore = new Score(paddle);
      playerpowerup = new Powerup();
      playerlevel = new Level();
      bricks = new ArrayList();
      initializebricks(playerlevel.level);
      gamestate = 0;
    }
  }
}

//win state
void youwin()
{

  fill(255);
  textAlign(CENTER);
  text("You Win!", width/2, height*0.2);
  text("Score:" + paddle.score, width/2, height*0.3);

  text("Press spacebar to go back to menu", width/2, height*0.5);
  if (keyPressed)
  {
    if ( key == ' ')
    {
      //restart the score;
      level = 1;
      ball = new Ball();
      paddle = new Paddle();
      playerlife = new Life(paddle);
      playerscore = new Score(paddle);
      bricks = new ArrayList();
      initializebricks(playerlevel.level++);
      gamestate = 1;
    }
  }
}

//next level
void nextlevel()
{
  if( playerlevel.level == 5 )
  {
    youwin();
  }
  else
  {
      bricks = new ArrayList();
      initializebricks(playerlevel.level++);
      gamestate = 2;

      ball.Bcolor = color(255);
      ball.x = paddle.x + paddle.Pwidth/2;
      ball.y = paddle.y - ball.radius;  
      gamestate = 2;
      ball.xspeed = 5;
      ball.yspeed = -5;
  }
}


void lostlife()
{
  playerlevel.display();
  stroke(255);
  line(0, height-30, width, height-30);
  line(0, 45, width, 45);

  textAlign(CENTER);
  text("Press spacebar to continue!", width/2, height/2);

  playerpowerup.display();
  paddle.display();
  paddle.control();
  ball.display();
  playerlife.draw();
  playerscore.draw();
  displaybricks();
  fill(255);

  ball.Bcolor = color(255);
  ball.x = paddle.x + paddle.Pwidth/2;
  ball.y = paddle.y - ball.radius;  

  if (keyPressed)
  {
    if ( key == ' ')
    {
      gamestate = 2;
      ball.xspeed = 5;
      ball.yspeed = -5;
    }
  }

  if (paddle.life == 0)
  {
    gamestate = 4;
  }
}




