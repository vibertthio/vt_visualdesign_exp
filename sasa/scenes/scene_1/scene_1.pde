// Collision Detection
// Use ArrayList to store all the circles
// and an array to ArrayList to detect the circles at specific position

Circles circles;
float unit = 80;
int nOfR;
int nOfC;

color c1 = color(219, 10, 91);
color c2 = color(236, 236, 236);
color c3 = color(68, 108, 179); // SAN MARINO
color c4 = color(197, 239, 247); // HUMMING BIRD
color c5 = color(44, 62, 80); // MADISON
color c6 = color(220, 198, 224);
color c7 = color(233, 212, 96); // TRIGGER

void setup() {
  size(800, 400);
  nOfC = round(width / unit) + 1;
  nOfR = round(height / unit) + 1;
  println("nOfC : " + nOfC);
  println("nOfR : " + nOfR);
  circles = new Circles();
}

void draw() {
  // println(frameRate);
  background(c5);
  circles.render();
}

void mousePressed() {
  if (key == 'a') {
    circles.addCircle(mouseX, mouseY);
  } else if (key == 'r') {
    circles.removeCircles(mouseX, mouseY);
  } else if (key == 'p') {
    circles.addCirclePlayer(mouseX, mouseY);
  }  else {
    circles.mousePressed(mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("frame/####.png");
  }
}
