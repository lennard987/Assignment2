//c14337331 - Lennard Bandol 

Ball ball;
Paddle paddle;

void setup()
{
  size(800,600);
  smooth();
  
  ball = new Ball();
  paddle = new Paddle();
}

void draw()
{
  background(0);
   paddle.PaddlePosition(mouseX, height - 30);
  paddle.display();
}
