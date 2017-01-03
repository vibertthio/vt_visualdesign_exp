float t;
int numberOfLine = 10;

void setup() {
  background(30);
  size(500, 500);
  t = 0;
}

void draw() {
  background(30);
  // strokeWeight(2);
  stroke(255);
  translate(width/2, height/2);
  // point(f_1(t), f_2(t));
  // point(f_3(t), f_4(t));
  // line(f_3(t), f_4(t), f_3(t + 2), f_4(t + 2));
  for (int i = 0; i < numberOfLine; i++) {
    float k = i * 5;
    line(f_1( t + k ), f_2( t + k ), f_3( t + k ), f_4( t + k ));
  }

  t += 1;
}


float f_1( float t ) {
  float ret;
  ret = 50 * sin( t / 15 ) + 100 * cos ( t / 30 );
  return ret;
}

float f_2( float t ) {
  float ret;
  ret = 50 * cos ( t / 20 ) - 30 * sin ( t / 100 );
  return ret;
}

float f_3( float t ) {
  float ret;
  ret = 100 * sin ( t / 50 ) * cos ( t / 40);
  // ret = 100 * sin ( PI *  cos ( t / 15 ) );
  return ret;
}

float f_4( float t ) {
  float ret;
  ret = 100 * cos ( t / 50 ) * cos ( t / 40);
  return ret;
}

void keyPressed() {
  if ( key == 'a' ) {
    noLoop();
  }
  if ( key == 'b' ) {
    loop();
  }
}
