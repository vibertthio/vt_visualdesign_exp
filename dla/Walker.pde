class Walker {
  float x;
  float y;
  float r = 10;
  float step = 1;

  boolean stuck = false;

  Walker() {
    x = random(0, width);
    y = random(0, height);
  }

  Walker(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void walk() {
    x += random(-1 * step, step);
    y += random(-1 * step, step);
  }

  void show() {
    if ( !stuck ) {
      noStroke();
      fill(255);
      ellipse(x, y, r*2, r*2);
    }
    else {
      noStroke();
      fill(255, 0, 0);
      ellipse(x, y, r*2, r*2);
    }
  }

  boolean checkStuck( ArrayList<Walker> others) {
    for (int i = 0, n = others.size(); i<n; i++) {
      Walker o = others.get(i);
      if ( distSq(x, y, o.x, o.y) < pow((r + o.r), 2) ) {
        stuck = true;
        return true;
      }
    }
    return false;
  }


}

float distSq(float x1, float y1, float x2, float y2) {
  return pow((x1 - x2), 2) + pow((y1 - y2), 2);
}
