abstract class Controller
{
  abstract float[] getPos();
}

class HorizontalController extends Controller
{
  float x, y, s;
  int direction;
    
  HorizontalController(float _x, float _y, float _s, int _direction)
  {
    x = _x;
    y = _y;
    s = _s;
    direction = _direction;
    if (direction == 3){ s *= -1;}
  }
  
  float[] getPos()
  {
    this.x += this.s;
    return new float[]{x, y};
  }
}

