class MyBullet {
  float xPos, yPos;

  MyBullet(float _xPos, float _yPos) {
    xPos = _xPos;
    yPos = _yPos;
  }

  boolean bulletGo(ArrayList<Enemy> enemies) {
    yPos = yPos - 5;
    ellipse(xPos, yPos, 5, 5);

    for (Enemy e : enemies)
    {
      if(frameCount < e.startTime){continue;}

      float distance = dist(xPos, yPos, e.x, e.y);
      if (distance < 25) { 
        e.isDead = true;
      }
    }

    return true;
  }
}

