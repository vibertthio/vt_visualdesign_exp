ArrayList<Circle> circles;
float unit = 80;
int nOfR;
int nOfC;

PShader shade;


color c1 = color(219, 10, 91);
color c2 = color(236, 236, 236);

void setup() {
  size(960, 540, P2D);
  circles = new ArrayList<Circle>();
  nOfC = round(width / unit);
  nOfR = round(height / unit);

  shade = loadShader("pixelate.glsl");
}

void draw() {
  shade.set("pixels", 0.1 * mouseX, 0.1 * mouseY);
  shader(shade);
  sasa();
  println(frameRate);
  for (int i = 0, n = circles.size(); i < n; i++) {
    Circle cir = circles.get(i);
    cir.update();
    cir.render();
  }
  resetShader();

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
