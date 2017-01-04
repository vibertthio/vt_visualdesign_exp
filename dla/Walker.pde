class Walker {
  float x;
  float y;
  float r = 3;
  float step = 1;
  color c;


  boolean stuck = false;

  Walker() {
    // x = random(0, width);
    // int i = floor(random(2));
    // if (i==0) { y = 0; }
    // else if (i==1) { y = height; }
    c = lerpColor(c1, c2, constrain((tree.size()/float(nOft)), 0, 1));

    x = width/2;
    y = height/2;

    // x = random(0, width);
    // y = random(0, height);
    //
    // int i = floor(random(4));
    // if (i==0) { x = 0; }
    // else if (i==1) { x = width; }
    // else if (i==2) { y = 0; }
    // else { y = height; }

  }

  Walker(float _x, float _y, boolean _s) {
    x = _x;
    y = _y;
    stuck = _s;
    c = lerpColor(c1, c2, constrain((tree.size()/float(nOft)), 0, 1));
  }

  void walk() {
    // x = constrain( x + random(-1 * step, step), 0, width);
    // if (y>height/2) {
    //   y = constrain( y + random(-1 * step, step - 0.05), 0, height);
    // }
    // else {
    //   y = constrain( y + random(-1 * step, step + 0.05), 0, height);
    // }

    //normal
    x = constrain( x + random(-1 * step, step), 0, width);
    y = constrain( y + random(-1 * step, step), 0, height);

    // tree
    // y = constrain( y + random(-1 * step, step + 0.05), 0, height);
  }

  void show() {
    if ( !stuck ) {
      noStroke();
      fill(255);
    }
    else {
      noStroke();
      // fill(100, 255, 200);
      fill(c);
    }
    ellipse(x, y, r*2, r*2);

  }

  boolean checkStuck( ArrayList<Walker> others) {
    for (int i = others.size()-1, limit = (others.size() - 500); (i>limit)&&(i>=0); i--) {
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
