abstract class Controller
{
  abstract float[] getPos();
}

class HorizontalController extends Controller
{
  float x, y, s;
  int direction;
    
  HorizontalController(String[] args)
  {
    x = parseFloat(args[3]);
    y = parseFloat(args[4]);
    s = parseFloat(args[5]);
    direction = parseInt(args[6]);

    if (direction == 3){ s *= -1;}
  }
  
  float[] getPos()
  {
    this.x += this.s;
    return new float[]{x, y};
  }
}

Controller createController(String[] args)
{
  String controllerType = args[2];

  if(controllerType.equals("Horizontal"))
  {
    return new HorizontalController(args);
  }

  //Error
  println(controllerType);
  exit();
  return null;
}

