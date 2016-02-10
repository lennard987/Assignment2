class Menu
{
  void display()
  {
 
    background(0);

    cursor();
    noStroke();
    textAlign(CENTER);
   

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
 
    rectMode(CENTER);
    rect(width/2,90,width,40,5);
    rectMode(CORNER);
    fill(0);
    textSize(35);
    text("Breakout",width/2,100); 
    //first option
    if (mouseX>=width*0.25 && mouseX <= width*0.75)
    {
      if (mouseY>=height*0.2 && mouseY<= height*0.2 + Rheight)
      {
        textSize(25);
        fill(255, 0, 0);
        rect(width*0.25, height*0.2, width*0.5, height*0.15, 25);
        cursor(HAND);
        fill(0);
        text("PLAY", width*0.5, height*0.30);
        if (mousePressed)
        {
            gamestate = 1;
        }
      }
    }
    
    
  }
}

