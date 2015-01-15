class Enemy
{
  float x, y;
  float w = 50, h = 50;
  int frame = 0;

  Enemy(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  void draw()
  {
    rect(x, y, w, h);
  }
  
  void done()
  {
    if(frame % 30 == 0)
    {
      //add missile
    }
      
    frame++;
  }
}

