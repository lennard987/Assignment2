class Menu
{
  void display()
  {
    cursor();
    noStroke();
    textAlign(CENTER);
    textSize(25);

    float Rheight = height*0.15;
    float Rwidth = width*0.5;
    color Rcolor = color(255);
    color Tcolor = color(0);
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
}

