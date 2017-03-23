class Vines {
  ArrayList<Vine> vines;
  ArrayList<Vines> children;

  int mass = 8;
  int life = floor(1e4);
  int sz = 60;
  int maxSizeOfVinePath = 100;
  int maxSizeOfVines = 50;
  float velocityRatio = 0.1;
  float bitrhRatio = 0.000001;
  float rotateRatio = 0.5;
  float angleRange = 0.5;
  float widthDecay = 2;
  float childrenLifeDecay = 100;

  float _x;
  float _y;
  float _a;
  int _depth;

  Vines(float x, float y, float a, int d) {
    vines = new ArrayList<Vine>();
    children = new ArrayList<Vines>();
    _x = x;
    _y = y;
    _a = a;
    _depth = d;
    vines.add(new Vine(x, y, a, 0, mass, life));
  }

  void update() {
    // println("-----update-----");
    for (int i = 0, n = vines.size(); i < n; i++) {
      Vine v = vines.get(i);
      if (v._path.size() <= maxSizeOfVinePath) {
        v._l -= 1;
        v._x += cos(v._a) * v._w * velocityRatio;
        v._y += sin(v._a) * v._w * velocityRatio;
        v._a += (v._ai * rotateRatio) / v._w;
        v._path.add(new Node(v._x, v._y));
        if (frameCount % 15 == 0) {
          v._ai = random(-angleRange, angleRange);
        }
        if (v._w > 1 && random(1) < (v._l * bitrhRatio) && vines.size() < maxSizeOfVines) {
          vines.add(new Vine(v._x,
          v._y,
          v._a,
          v._ai,
          v._w / widthDecay,
          min(v._l / childrenLifeDecay, v._w * 16 * (1 + random(1)))));
        }
      } else if (!v._giveBirth && _depth > 0){
        children.add(new Vines(v._x, v._y, v._a, _depth - 1));
        v._giveBirth = true;
      }
    }
  }

  void render() {
    for (int i = 0, n = vines.size(); i < n; i++) {
      Vine v = vines.get(i);
      noFill();
      stroke(255);
      beginShape();
      for (int j = v._path.size() - 1; j >= 0; j--) {
        vertex(v._path.get(j)._x, v._path.get(j)._y);
      }
      endShape();
    }

    fill(0);
    stroke(255);
    ellipse(_x, _y, 5, 5);

    for (Vines v : children) {
      v.update();
      v.render();
    }
  }
}
