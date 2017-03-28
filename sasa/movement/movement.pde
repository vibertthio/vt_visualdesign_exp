ArrayList<Circle> circles;
float unit = 80;
int nOfR;
int nOfC;

color c1 = color(219, 10, 91);
color c2 = color(236, 236, 236);



void setup() {
  size(1920, 1080);
  circles = new ArrayList<Circle>();
  nOfC = round(width / unit);
  nOfR = round(height / unit);


}

void draw() {
  sasa();
  println(frameRate);
  for (int i = 0, n = circles.size(); i < n; i++) {
    Circle cir = circles.get(i);
    cir.update();
    cir.render();
  }
}


void sasa() {
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    // pixels[i] = lerpColor(c1, c2, random(1));
    pixels[i] = random(1) > 0.5 ? c1 : c2;
  }
  updatePixels();

}

void mousePressed() {
  circles.add(new Circle(mouseX, mouseY, unit / 2));
  // saveFrame("bk-######.png");
}

int count = 0;
void keyPressed() {
  if (key == 's') {
    saveFrame("frame/" + width + "x" + height + "_" + count++ + ".png");
  }
}
