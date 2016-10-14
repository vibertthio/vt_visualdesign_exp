float r = 500;
int n = 100;
float angle = 0;
float offsetAngle = 0;
float offsetAngleY = 180;
float range = 180;
float iteration = 0;
boolean loop = true;
boolean x_rotate = true;
boolean y_rotate = false;
boolean z_rotate = false;
float[][] y;

void setup() {
  size(800, 800, P3D);
  frameRate(60);
  y = new float[n][n];
  for(int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      y[i][j] = 50 * sin(radians(i*j));
    }
  }
}




void draw() {
  translate(width/2, height/2);
  background(0);

  //rotateY(radians(offsetAngle));
  rotateY(2*PI*mouseX/width);
  //rotateX(radians(offsetAngleY));
  rotateX(2*PI*mouseY/height);

  noFill();
  stroke(255);
  strokeWeight(1.5);
  //float delta = r/n;
  //float angleDelta = angle/n;

  for(int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      point(5 * i, y[i][j], 5 * j);
    }
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