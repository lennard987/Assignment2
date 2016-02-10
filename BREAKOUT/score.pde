class Score{
  Paddle paddle;
  
  float textX;
  float textY;
  
  Score(Paddle paddle)
  {
    this.paddle = paddle;
    textX = width - 25;
    textY = 35;
  }
  
  int currentscore()
  {
    return paddle.getscore();
  }
  
  void draw()
  {
    textSize(30);
    textAlign(RIGHT);
    fill(255);
    text(currentscore(),textX,textY);
    text("Score:",textX - 75,textY);
  }
}
