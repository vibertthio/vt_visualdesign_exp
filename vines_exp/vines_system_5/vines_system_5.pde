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
  fill(0, 9);
  rect(0, 0, width, height);

  while (vines.size() > 1000) {
    vines.remove(0);
  }

  int r = floor((noise(frameCount/200.0) * rate * 1.5 + offset) * scale);
  int g = floor((pow(sin(noise(frameCount/100.0 + 100) * PI), 3) * rate + offset) * scale);
  int b = floor((sin(noise(frameCount/50.0 + 200) * PI) * rate + offset - 3) * scale);
  color col = color (r, g, b);
  noStroke();
  stroke(col);

  for (int i = vines.size() - 1; i >= 0; i--) {
    Vine v = vines.get(i);
    if (v.life > 0) {
      v.render();
    } else {
      if (v.depth > 0) {
        conti(v.x, v.y, v.angle, v.depth - 1);
      }
      vines.remove(i);
    }
  }

  if(frameCount <= 500 && frameCount%2 == 0){
    TImage frame = new TImage(width,height,RGB,sketchPath("frame_"+nf(frameCount,3)+".png"));
    frame.set(0,0,get());
    frame.saveThreaded();
  }
}

void mousePressed() {
  spark(mouseX, mouseY, 20);
}

void spark(float x, float y, int n) {
  for (int i = 0; i < n; i++) {
    vines.add(new Vine(x, y, i * 2 * PI / n, 2));
  }
}

void conti(float x, float y, float a, int d) {
  for (int i = 0; i < 3; i++) {
    vines.add(new Vine(x, y, a + random(-1, 1), d));
  }
}
