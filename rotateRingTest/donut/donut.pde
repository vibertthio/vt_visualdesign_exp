void setup() {
  size(1000, 1000, P3D);
  frameRate(160);
}

float r_ring = 320;
float r = 30;
float r_change = 30;
float n = 80;
float angle = 0;
float offsetAngle = 250;
float offsetAngleY = 125;
float range = 300;
float iteration = 0;
float r_iteration = 0;

float angleDelta = 360 / n;


void draw() {
  translate(width/2, height/2);
  background(0);
  rotateY(2*PI*mouseX/width);
  rotateX(2*PI*mouseY/height);

  noFill();
  stroke(255);
  strokeWeight(0.5);
  rotateY(radians(iteration));

  for(int i = 0; i < n; i++) {
    pushMatrix();

    float a = map( angleDelta * i - iteration , 0, 2*PI, 0, 10*PI);
    //float r_change = pow(cos(radians(r_iteration)),2);
    float r_change = pow(cos(radians(r_iteration)),2);
    // float radius = r * ( 1 + 1 * r_change * pow( cos(radians(a /*- r_iteration*/)), 4) );
    float radius = r * ( 1 + 0.5 * pow( cos(radians(a /*- r_iteration*/)), 4) );

    // rotateZ( radians ( range * sin(radians(iteration/2) /*+ 1.5*pow(sin(radians(2.5*i)),3 )*/ ) ) );
    // rotateX( radians ( range * sin(radians(iteration/2) /*+ 1.5*pow(sin(radians(2.5*i)),3 )*/ ) ) );

    //translate(r_ring * cos( radians( angleDelta * i) ), 15*cos(radians(a))*r_change,r_ring * sin( radians( angleDelta * i) ) );
    translate(r_ring * cos( radians( angleDelta * i) ), 0,r_ring * sin( radians( angleDelta * i) ) );
    rotateY( -1 * radians( angleDelta * i) );

    ellipse(0, 0, 2 * radius, 2 * radius);
    popMatrix();
  }

  iteration += 0.2;
  r_iteration += 2;
  println("iteration = " + str(iteration));

}

void keyPressed() {
  if (key == 'a') {
    offsetAngle = offsetAngle + 10;
  }
  if (key == 'b') {
    offsetAngle = offsetAngle - 10;
  }
}
