ArrayList<Circle> circles;
float unit = 80;
int nOfR;
int nOfC;

color c1 = color(219, 10, 91);
color c2 = color(236, 236, 236);

void setup() {
  size(960, 540);
  circles = new ArrayList<Circle>();
  nOfC = round(width / unit);
  nOfR = round(height / unit);
}

void draw() {
  println(frameRate);
  background(230);
  for (int i = 0, n = circles.size(); i < n; i++) {
    Circle cir = circles.get(i);
    cir.update();
    cir.render();
  }
}

void mousePressed() {
  circles.add(new Circle(mouseX, mouseY, unit / 2));
}

void keyPressed() {
  if (key == 'a') {
    saveFrame("frame/####.png");
  }
}
