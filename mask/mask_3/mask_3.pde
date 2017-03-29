String[] shaders = new String[] {
  "brcosa.glsl",
  "blur.glsl",
};

Group group;

void setup() {
  size(1920, 1080, P2D);
  background(0);
  group = new Group();
}

void draw() {
  background(0);
  group.render();
}

void keyPressed() {
  group.keyPressed();
}

void mousePressed() {
  group.mousePressed();
}

void setShaderParameters(int index, PShader shade) {
  if (index == 0) {
    shade.set("brightness", 1.0);
    shade.set("contrast", random(-5, 5));
    shade.set("saturation", random(-5, 5));
  } else if (index == 1) {
    shade.set("sigma", random(10));
    shade.set("blurSize", (int) random(30));
  }
}

color getColor() {
  float rate = 15;
  float offset = 3;
  int scale = 9;
  int r = floor((noise(frameCount/200.0) * rate * 1.5 + offset) * scale);
  int g = floor((pow(sin(noise(frameCount/100.0 + 100) * PI), 3) * rate + offset) * scale);
  int b = floor((sin(noise(frameCount/50.0 + 200) * PI) * rate + offset - 3) * scale);
  return color (r, g, b);
}
