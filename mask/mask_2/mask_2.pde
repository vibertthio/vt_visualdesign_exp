ArrayList<Vine> vines;
float rate = 15;
float offset = 3;
int scale = 9;

PImage mask;


void setup() {
  size(1920, 1080);
  background(0);
  vines = new ArrayList<Vine>();
  mask = loadImage("mask2.png");

}


void draw() {
  // background(0);
  imageMode(CENTER);
  image(mask, width / 2, height / 2);

  while (vines.size() > 1000) {
    vines.remove(0);
  }

  int r = floor((noise(frameCount/200.0) * rate * 1.5 + offset) * scale);
  int g = floor((pow(sin(noise(frameCount/100.0 + 100) * PI), 3) * rate + offset) * scale);
  int b = floor((sin(noise(frameCount/50.0 + 200) * PI) * rate + offset - 3) * scale);
  color col = color (r, g, b);
  noStroke();
  stroke(col);

  for (int i = 0, n = vines.size(); i < n; i++) {
    vines.get(i).render();
  }

}


void keyPressed() {
  if (key == ' ') {
    background(0);
  }
}

void mouseDragged() {
  vines.add(new Vine(mouseX, mouseY));
}
