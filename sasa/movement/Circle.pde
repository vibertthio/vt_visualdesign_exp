class Circle {
  float x;
  float y;
  float r;
  float accel = 0.1;

  int ic; // index of column
  int ir; // index of row
  boolean moving = false;

  int count;

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

    if (random(1) < 2e-2) {
      shift();
    }
    checkMargin();
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
      ic = nOfC;
    } else if (x > width + unit / 2) {
      x = 0;
      ic = 0;
    }

    if (y < - unit / 2) {
      y = height;
      ir = nOfR;
    } else if (y > height + unit / 2) {
      y = 0;
      ir = 0;
    }


  }

  void render() {
    fill(c2, 100);
    noStroke();
    float dim = r * (sin(count++ / 20.0) * 0.2 + 1);
    ellipse(x, y, dim, dim);
  }
}
