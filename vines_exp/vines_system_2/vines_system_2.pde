ArrayList<Vine> vines;
float rate = 15;
float offset = 3;
int scale = 9;

void setup() {
  size(1920, 1080, P2D);
  background(0);
  vines = new ArrayList<Vine>();
}

void draw() {
  if (frameCount % 5 == 0) {
    fill(0, 1);
    rect(0, 0, width, height);
  }

  while (vines.size() > 200) {
    vines.remove(0);
  }

  int r = floor((noise(frameCount/200.0) * rate * 1.5 + offset) * scale);
  int g = floor((pow(sin(noise(frameCount/100.0 + 100) * PI), 3) * rate + offset) * scale);
  int b = floor((sin(noise(frameCount/50.0 + 200) * PI) * rate + offset - 3) * scale);
  println("noise:" + noise(frameCount));
  println("r:" + r);
  println("g:" + g);
  println("b:" + b);
  color col = color (r, g, b);
  noStroke();
  fill(255);
  stroke(col, 5);

  for (int i = 0, n = vines.size(); i < n; i++) {
    vines.get(i).render();
  }
}

void mouseDragged() {
  vines.add(new Vine(mouseX, mouseY));
}
