int steps = 5;
float restSize = 3;
ArrayList<Particle> allParticles = new ArrayList<Particle>();
int t;
int globalHue = 0;



void setup() {
  size(1000, 800);
  colorMode(HSB, 255);
  textAlign(CENTER);
  textSize(16);

  t = width;

  for (float x = 0; x < width; x += steps) {
    float y = (height * 0.25) + (noise(x * 0.005) * 500);
    allParticles.add(new Particle(x, y));
  }
}

void draw() {
  background(50);
  noFill();

  for (int i = 0; i < allParticles.size() - 1; i++) {
    Particle p = allParticles.get(i);
    p.move();

    if (i > 1) {
      float d = dist(p.pos.x, p.pos.y, p.target.x, p.target.y);
      stroke(p.hue, d * 10, 255);
      strokeWeight(constrain(d * 0.1, 1, 7));

      beginShape();
      curveVertex(allParticles.get(i - 2).pos.x, allParticles.get(i - 2).pos.y);
      curveVertex(allParticles.get(i - 1).pos.x, allParticles.get(i - 1).pos.y);
      curveVertex(p.pos.x, p.pos.y);
      curveVertex(allParticles.get(i + 1).pos.x, allParticles.get(i + 1).pos.y);
      endShape();
    }

    if (p.pos.x < -50) {
      allParticles.remove(i);
    }
  }

  if (t % steps == 0) {
    float y = (height * 0.25) + noise(t * 0.005) * 500;
    allParticles.add(new Particle(width, y));
  }
  t += 1;

  noStroke();
  fill(255);
  text("Move the mouse on the lines", width/2, 100);
}
