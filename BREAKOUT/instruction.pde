class Instruction
{
  void display()
  {
    noCursor();
    fill(255);
    stroke(255);
    textSize(50);
    textAlign(CENTER);
    text("How to Play", width/2, 100 );

    textSize(30);
    text("Use <- or -> button to move the paddle", width/2, 150);

    text("Power Up Buttons", width/2, 200);
    text("-------------------------", width/2, 225);    
    text("Q -larger paddle", width/2, 250);
    text("W - larger ball", width/2, 300);
    text("E - faster paddle", width/2, 350);
    text("-------------------------", width/2, 375);

    fill(255, 0, 0);
    text("Each power up Used decreases Score gain by 5!", width/2, 400 );


    fill(255);
    text("Press Space to start", width/2, 460);

    if (keyPressed)
    {
      if (key == ' ' )
      gamestate=2;
      ball.Bcolor = color(255);
      ball.x = paddle.x + paddle.Pwidth/2;
      ball.y = paddle.y;  
      
    }
  }
}

