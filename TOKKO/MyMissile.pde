class MyMissile {
  float xPos, yPos;

  MyMissile(float _xPos, float _yPos) {
    xPos = _xPos;
    yPos = _yPos;
  }

  boolean missileGo(ArrayList<Enemy> enemies) {
    yPos = yPos - 5;
    ellipse(xPos, yPos, 5, 5);

    for (Enemy e : enemies)
    {
      float distance = 100;
      distance = dist(xPos, yPos, e.x, e.y);
      if (distance < 25) { 
        e.isDead = true;
      }
    }

    return true;
  }
}

