class Ball {
  int ix;
  int iy;
  int iz;

  float x;
  float y;
  float z;
  float r = unit / 5;
  private float accel = 0.1;

  boolean moving;

  Ball(int _ix, int _iy, int _iz) {
    ix = _ix;
    iy = _iy;
    iz = _iz;
    x = _ix * unit;
    y = _iy * unit;
    z = _iz * unit;
  }


  void update() {
    float x_d = ix * unit;
    float y_d = iy * unit;
    float z_d = iz * unit;
    x += (x_d - x) * accel;
    y += (y_d - y) * accel;
    z += (z_d - z) * accel;
  }


  void render() {
    pushMatrix();
    noStroke();
    lights();
    fill(colorList[7], 255);
    translate(-width / 2, -height / 2, -depth / 2);
    translate(x, y, z);
    sphere(r);
    popMatrix();
  }

  void shiftRandom() {
    float k = random(6);
    if (k < 1) {
      shiftX(1);
    } else if (k < 2) {
      shiftX(-1);
    } else if (k < 3) {
      shiftY(1);
    } else if (k < 4) {
      shiftY(-1);
    } else if (k < 5) {
      shiftZ(1);
    } else {
      shiftZ(-1);
    }
  }

  void shiftX(int amt) {
    ix = constrain(ix + amt, 0, nOfC);
  }

  void shiftY(int amt) {
    iy = constrain(iy + amt, 0, nOfR);
  }
  void shiftZ(int amt) {
    iz = constrain(iz + amt, 0, nOfD);
  }
}
