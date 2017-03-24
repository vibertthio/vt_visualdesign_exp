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

  Circle(float _x, float _y, float _r) {
    x = _x;
    y = _y;
    r = _r;

    ic = round(x / unit);
    ir = round(y / unit);

    count = 0;
  }

  void update() {
    float x_ = ic * unit;
    float y_ = ir * unit;
    x += (x_ - x) * accel;
    y += (y_ - y) * accel;
    if (dist(x_, y_, x, y) > unit / 8) {
      moving = true;
    } else {
      moving = false;
    }

    checkMargin();

    spark += (0 - spark) * 0.1;
  }

  void shift() {
    float k = random(1);
    if (k < 0.25) {
      ic += 1;
    } else if (k < 0.5) {
      ic -= 1;
    } else if (k < 0.75) {
      ir += 1;
    } else {
      ir -= 1;
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
    fill(c6, 100);
    noStroke();
    float dim = r * (sin(count++ / 20.0) * 0.2 + 1);
    ellipse(x, y, dim, dim);

    // spark
    fill(c7, spark);
    ellipse(x, y, dim, dim);
  }

  void spark() {
    spark = 200;
  }
}

class CirclePlayer extends Circle {
  Circles circles;
  CirclePlayer(float _x, float _y, float _r, Circles _c) {
    super(_x, _y, _r);
    circles = _c;
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
    fill(c1, 100);
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
