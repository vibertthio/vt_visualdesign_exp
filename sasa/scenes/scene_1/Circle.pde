class Circle {
  float x;
  float y;
  float r;
  float accel = 0.1;

  int ic; // index of column
  int ir; // index of row
  boolean moving = false;

  int count;

  float spark = 0;
  Circles circles;
  private float colorRandomRate = 2e-2;


  // Color Modes
  // 0 : steady
  // 1 : breathing
  // 2 : random
  int colorMode = 0;
  int colorIndex = 5;
  color color_now;
  color color_target;


  // Radius Modes
  // 0 : steady
  // 1 : breathing
  // 2 : random
  // 3 : biggggg
  int radiusMode = 0;
  private float radiusBreathingRate = 0.05;
  private float r_now;
  private float r_rand;
  private float r_accel = 0.1;
  private float r_trig;
  private float r_big = width / 2;
  private float radiusRandomRate = 2e-2;




  Circle(float _x, float _y, float _r, Circles _c) {
    x = _x;
    y = _y;
    r = _r;
    r_trig = 2 * r;
    r_rand = r;
    circles = _c;

    ic = round(x / unit);
    ir = round(y / unit);

    count = 0;
  }

  void update() {
    float x_ = ic * unit;
    float y_ = ir * unit;
    x += (x_ - x) * accel;
    y += (y_ - y) * accel;
    if (dist(x_, y_, x, y) > unit / 16) {
      moving = true;
    } else {
      moving = false;
    }

    checkMargin();

    spark += (0 - spark) * 0.1;
  }

  void shiftRandom() {
    float k = random(1);
    if (k < 0.25) {
      shiftRight();
    } else if (k < 0.5) {
      shiftLeft();
    } else if (k < 0.75) {
      shiftUp();
    } else {
      shiftDown();
    }
  }

  void shiftRight() {
    update();
    if (!moving) {
      int index = ir * nOfC + ic;
      circles.map.get(index).remove(this);
      int _index;
      ic += 1;
      _index = index + 1;
      if (ic >= nOfC) {
        _index = ir * nOfC;
      }
      circles.map.get(_index).add(this);
    }
  }
  void shiftLeft() {
    update();
    if (!moving) {
      int index = ir * nOfC + ic;
      circles.map.get(index).remove(this);
      int _index;
      ic -= 1;
      _index = index - 1;
      if (ic < 0) {
        _index += nOfC;
      }
      circles.map.get(_index).add(this);
    }
  }
  void shiftDown() {
    update();
    if (!moving) {
      int index = ir * nOfC + ic;
      circles.map.get(index).remove(this);
      int _index;
      ir += 1;
      _index = index + nOfC;
      if (ir >= nOfR) {
        _index -= nOfR * nOfC;
      }
      circles.map.get(_index).add(this);
    }
  }
  void shiftUp() {
    update();
    if (!moving) {
      int index = ir * nOfC + ic;
      circles.map.get(index).remove(this);
      int _index;
      ir -= 1;
      _index = index - nOfC;
      if (ir < 0) {
        _index += nOfR * nOfC;
      }
      circles.map.get(_index).add(this);
    }
  }

  void checkMargin() {
    if (x < - unit / 2) {
      x = width;
      ic = nOfC - 1;
    } else if (x > width + unit / 2) {
      x = - unit / 2;
      ic = 0;
    }

    if (y < - unit / 2) {
      y = height + unit / 2;
      ir = nOfR - 1;
    } else if (y > height + unit / 2) {
      y = - unit / 2;
      ir = 0;
    }
  }

  void render() {
    fill(getColor(), 100);
    noStroke();
    float dim = getRadius();
    ellipse(x, y, dim, dim);

    // spark
    fill(colorList[6], spark);
    ellipse(x, y, dim, dim);
  }
  private color getColor() {
    // Color Modes
    // 0 : steady
    // 1 : breathing
    // 2 : random
    if (colorMode == 0) {
      color_now = colorList[colorIndex];
    } else if (colorMode == 1) {

    }

    return color_now;
  }
  private float getRadius() {
    // Radius Modes
    // 0 : steady
    // 1 : breathing
    // 2 : random
    // 3 : biggggg
    if (radiusMode == 0) {
      r_now += (r - r_now) * r_accel;
    } else if (radiusMode == 1) {
      r_now = r * (sin(count++ * radiusBreathingRate) * 0.2 + 1);
    } else if (radiusMode == 2) {
      if (random(1) < radiusBreathingRate) {
        r_rand = random(0.3 * r, 2 * r);
      }
      r_now += (r_rand - r_now) * r_accel;
    } else if (radiusMode == 3) {
      r_now += (r_big - r_now) * r_accel;
    }

    return r_now;
  }

  void triggerRadius() {
    r_now = r_trig;
  }

  void spark() {
    spark = 200;
  }
}

class CirclePlayer extends Circle {

  CirclePlayer(float _x, float _y, float _r, Circles _c) {
    super(_x, _y, _r, _c);
  }

  void update() {
    float x_ = ic * unit;
    float y_ = ir * unit;
    x += (x_ - x) * accel;
    y += (y_ - y) * accel;
    if (dist(x_, y_, x, y) > unit / 16) {
      moving = true;
    } else {
      if (moving) {
        if (circles.getMap(ir, ic).size() > 1) {
          trigger();
          sparkCircles(circles.getMap(ir, ic));
        }
      }
      moving = false;
    }

    checkMargin();
  }

  void render() {
    float dim = r * (sin(count++ / 20.0) * 0.2 + 1);
    noStroke();
    fill(colorList[0], 100);
    ellipse(x, y, dim, dim);
  }

  void trigger() {
    println("trigger!!!!!!");
  }

  private void sparkCircles(ArrayList<Circle> ls) {
    for (int i = 0, n = ls.size(); i < n; i++) {
      ls.get(i).spark();
    }
  }
}
