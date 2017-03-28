import peasy.*;

PeasyCam cam;
ArrayList<Ball> balls;

int depth =800;
float unit = 80;
int nOfR;
int nOfC;
int nOfD;

color[] colorList = {
  color(219, 10, 91),
  color(236, 236, 236),
  color(68, 108, 179), // SAN MARINO
  color(197, 239, 247), // HUMMING BIRD
  color(44, 62, 80), // MADISON
  color(220, 198, 224),
  color(233, 212, 96), // TRIGGER
  color(243, 156, 18),
  color(46, 204, 113),
};

void setup() {
  size(800, 800, P3D);

  // peasy cam
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(400);
  cam.setMaximumDistance(2000);

  nOfC = round(width / unit) + 1;
  nOfR = round(height / unit) + 1;
  nOfD = round(depth / unit) + 1;

  balls = new ArrayList<Ball>();
  for (int i = 0; i < nOfC; i++) {
    for (int j = 0; j < nOfR; j++) {
      for (int k = 0; k < nOfD; k++) {
        if (random(1) < 0.2) {
          balls.add(new Ball(i, j, k));
        }
      }
    }
  }
}


void draw() {
  background(colorList[4]);
  // translate(-width, -height);
  for (int i = 0, n = balls.size(); i < n; i++) {
    Ball b = balls.get(i);
    if (random(1) < 2e-2) {
      b.shiftRandom();
    }
    b.update();
    b.render();
  }
}
