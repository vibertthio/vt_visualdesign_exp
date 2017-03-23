float [] x, v;
int number = 50;
void setup() {
  size(1400, 700, P3D);
  x = new float[number];
  v = new float[number];
  for (int i = 0; i < number; i ++) {
    v[i] = random(3);
  
  }
}

void draw() {
  lights();
  //background(254);
  camera(mouseX, -mouseY, 500, 0, 0, 0, 0, 1, 0);
  for (int i = 0; i < number; i ++) {
  x [i]= x[i] + v[i];
  fill(255);
  pushMatrix();
  rotateZ(radians(x[i]*0.5));
  rotateY(radians(x[i]*0.4));
  rotateX(radians(frameCount));
  translate(300, 0, 0);
  rotateY(radians(frameCount));
  //scale(1, random(1), random(1));
  //strokeWeight(1);
  //noStroke();
  strokeWeight(0.5);
  stroke(0,5,0,30);
  translate(50, 50, 0);
  rotateX(mouseY * 0);
  rotateY(mouseX * 0.05);
  fill(mouseX * 1.2, mouseY * 2, 160);
  sphereDetail(mouseX / 60);
  sphere(40);
  //box(50);
  //sphere(5);
  popMatrix();
}
}