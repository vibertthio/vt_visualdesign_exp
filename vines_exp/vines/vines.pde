color bk_1 = color (144, 192, 240);
color bk_2 = color (100, 30, 30);
PImage bk;
ArrayList<Vine> vines;
int mass = 8;
int life = 100000;
int sz = 60;

void setup() {
  size(960, 540, P3D);
  background(255);

  bk = loadImage("bk3.png");
  vines = new ArrayList<Vine>();
  vines.add(new Vine(0, 0, 0, 0, mass, life));
}

void draw() {
  background(bk);
  update();
  render();
}

void update() {
  // println("-----update-----");
  for (int i = 0, n = vines.size(); i < n; i++) {
    Vine v = vines.get(i);
    v._l -= 1;
    v._x += cos(v._a) * v._w / 2;
    v._y += sin(v._a) * v._w / 2;
    v._a += v._ai / (2 * v._w);
    v._path.add(new Node(v._x, v._y));
    while(v._path.size() >= 100) {
      v._path.remove(0);
    }
    if (frameCount % 60 == 0) {
      v._ai = random(-0.5, 0.5);
    }
    if (v._w > 1 && random(1) < (v._l / 500000)) {
      vines.add(new Vine(v._x,
                         v._y,
                         v._a,
                         v._ai,
                         v._w/2,
                         min(v._l / 100, v._w*16*(1 + random(1)))));
    }
  }

  for (int i = vines.size() - 1; i >= 0; i--) {
    Vine v = vines.get(i);
    if (v._l < 1) {
      vines.remove(v);
    }
  }
}

void render() {
  // println("-----render-----");
  pushMatrix();
  for (int i = 0, n = vines.size(); i < n; i++) {
    Vine v = vines.get(i);
    if (v._w == 8) {
      translate(width / 2 - v._x, height / 2 - v._y);
    }
    noFill();
    stroke(255);
    beginShape();
    for (int j = v._path.size() - 1; j >= 0; j--) {
      vertex(v._path.get(j)._x, v._path.get(j)._y);
    }
    endShape();
  }
  popMatrix();

}
