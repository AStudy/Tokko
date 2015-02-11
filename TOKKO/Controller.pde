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

  
class KeyframeController extends Controller
{
  class Key
  {
    int frameNum;
    float x, y;
  }

  int startTime;
  Key[] keys;
    
  KeyframeController(String[] args)
  {
    startTime = parseInt(args[0]);
    ArrayList<Key> keyList = new ArrayList<Key>();
    
    for(int i=3; i<args.length; i+=4)
    {
      Key k = new Key();
      if(args[i].equals("")){break;}
      k.frameNum = parseInt(args[i]);
      k.x = parseFloat(args[i+1]);
      k.y = parseFloat(args[i+2]);
      keyList.add(k);
    }
    keys = keyList.toArray(new Key[0]);
  }
  
  float[] getPos()
  {
    int frame = frameCount - startTime;
    
    Key k = keys[keys.length - 1];
    if(k.frameNum <= frame){return new float[]{k.x, k.y};}
    
    int i;
    for(i=0; i<keys.length; i++)
    {
      k = keys[i];
      if(frame == k.frameNum){return new float[]{k.x, k.y};}
      else if(frame < k.frameNum){break;}
    }

    Key preKey = keys[i - 1];
    int denominate = k.frameNum - preKey.frameNum;
    int numerate = frame - preKey.frameNum;
    float ratio = numerate / (float)denominate;
    
    float x = lerp(preKey.x, k.x, ratio);
    float y = lerp(preKey.y, k.y, ratio);
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
  if(controllerType.equals("Keyframe"))
  {
    return new KeyframeController(args);
  }
  

  println("Error Controller Type");
  println(controllerType);
  exit();
  return null;
}

