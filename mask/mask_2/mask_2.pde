ArrayList<Vine> vines;
float rate = 15;
float offset = 3;
int scale = 9;

PImage mask;
PShader shade;
PGraphics pg;

void setup() {
  size(960, 540, P2D);
  background(0);
  vines = new ArrayList<Vine>();
  mask = loadImage("mask2_350.png");
  setupShader();
  pg = createGraphics(width, height);
  pg.shader(shade);
}

void draw() {
  // background(0);
  setShaderParameters();
  color col = getColor();
  drawVines(col);
  drawMask(col);
}

void drawVines(color col) {
  while (vines.size() > 1000) {
    vines.remove(0);
  }
  pg.beginDraw();

  pg.noStroke();
  pg.stroke(col);
  for (int i = 0, n = vines.size(); i < n; i++) {
    vines.get(i).render();
  }
  pg.endDraw();

  imageMode(CENTER);
  image(pg, width / 2, height / 2);
}

void drawMask(color col) {
  if (random(1) < 0.5) {
    imageMode(CENTER);
    tint(col);
    image(mask, width / 2, height / 2);
  }
}

void keyPressed() {
  if (key == ' ') {
    background(0);
  }
  if (key == 'r') {
    vines.clear();
  }
}

void mousePressed() {
  int number = 10;
  while(number-- > 0) {
    vines.add(new Vine(mouseX, mouseY));
  }
}

// Shader
void setupShader() {
  // shade = loadShader("blur.glsl");
  shade = loadShader("brcosa.glsl");
}

void setShaderParameters() {
  // shade.set("sigma", random(10));
  // shade.set("blurSize", (int) random(30));

  shade.set("brightness", 1.0);
  shade.set("contrast", random(-5, 5));
  shade.set("saturation", random(-5, 5));
}

color getColor() {
  int r = floor((noise(frameCount/200.0) * rate * 1.5 + offset) * scale);
  int g = floor((pow(sin(noise(frameCount/100.0 + 100) * PI), 3) * rate + offset) * scale);
  int b = floor((sin(noise(frameCount/50.0 + 200) * PI) * rate + offset - 3) * scale);
  return color (r, g, b);
}
