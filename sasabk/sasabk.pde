Circle[] circles;
int nOfR = 10;
int nOfC = 20;

color c1 = color(219, 10, 91);
// color c2 = color(108, 122, 137);
color c2 = color(236, 236, 236);

void setup() {
  size(960, 540);
  circles = new Circle[nOfR * nOfC];
  for (int i = 0; i < nOfC; i++) {
    for (int j = 0; j < nOfR; j++) {
      circles[i * nOfR + j] = new Circle(i * width / (nOfC - 1),
                                         j * height / (nOfR - 1),
                                         40);
    }
  }
}


void draw() {
  if (frameCount % 5 == 0) {
    sasa();
  }

  for (int i = 0, n = nOfR * nOfC; i < n; i++) {
    circles[i].render();
  }
}



void sasa() {
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    pixels[i] = lerpColor(c1, c2, random(1));
  }
  updatePixels();
}

class Circle {
  float x;
  float y;
  float r;

  Circle(float _x, float _y, float _r) {
    x = _x;
    y = _y;
    r = _r;
  }

  void render() {
    fill(c2, 50);
    noStroke();
    float dim = r * pow(sin(frameCount / 20.0), 2);
    ellipse(x, y, dim, dim);
  }
}
