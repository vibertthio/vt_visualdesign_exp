void setup() {
  size(800, 800, P3D);
  frameRate(160);
}

float r = 500;
int n = 30;
float angle = 0;
float offsetAngle = 0;
float offsetAngleY = 180;
float range = 180;
float iteration = 0;
boolean loop = true;
boolean x_rotate = true;
boolean y_rotate = false;
boolean z_rotate = false;



void draw() {
  translate(width/2, height/2);
  background(0);

  rotateY(2*PI*mouseX/width);
  rotateX(2*PI*mouseY/height);

  noFill();
  stroke(255);
  float delta = r/n;
  float angleDelta = angle/n;

  for(int i = 1; i <= n; i++) {
    pushMatrix();
    if (x_rotate)
      rotateX( radians ( range * sin(radians(iteration) + (n/4)*pow(sin(radians(50*i/n)),n/3 ) ) ) );
    if (y_rotate)
      rotateY( radians ( range * sin(radians(iteration) + (n/4)*pow(sin(radians(50*i/n)),n/3 ) ) ) );
    ellipse(0, 0, delta * i, delta * i);
    popMatrix();
  }

  if (loop)
    iteration += 0.2;
  //println("sin(radians(iteration)) = " + str( sin(radians(iteration)) ));
  println("iteration = " + str(iteration));

}

void keyPressed() {
  if (key == 'a') {
    offsetAngle = offsetAngle + 10;
  }
  if (key == 's') {
    offsetAngle = offsetAngle - 10;
  }
  if (key == 'x') {
    x_rotate = !x_rotate;
  }
  if (key == 'y') {
    y_rotate = !y_rotate;
  }
  if (key == 'z') {
    z_rotate = !z_rotate;
  }

  if (key == 'l') {
    if (loop) {
      loop = false;
      //noLoop();
    }
    else {
      loop = true;
      //loop();
    }
  }
}
