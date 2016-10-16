import ddf.minim.*;

Minim minim;
AudioPlayer groove;
AudioMetaData meta;

int bufferSize;
int n;
int devide = 16;

boolean loop = true;
boolean x_rotate = true;
boolean y_rotate = false;
boolean z_rotate = false;
float[][] y;

void setup() {
  size(800, 800, P3D);
  frameRate(60);

  minim = new Minim(this);
  groove = minim.loadFile("allalone.mp3");
  groove.play();
  bufferSize = groove.bufferSize();
  n = groove.bufferSize() / devide; // example : n = 1024/16 = 64,

  y = new float[n][n];
  for(int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      y[i][j] = 0;
    }
  }
}

//display parameters
int density = 2;
float amp = 2.5;
float power = 2;
float enhance = 3;
float damp = 0.1;
float value;
float p_distance = 6;

void draw() {
  translate(width/2, height/2);
  background(0);

  rotateY(2*PI*mouseX/width);
  rotateX(2*PI*mouseY/height);

  noFill();
  stroke(255);
  strokeWeight(1.5);

  for(int i = 0; i <  n; i++) {
    for (int j = 0; j <  n; j++) {
      // value = pow(groove.left.get( density * i) * amp, power) +
      //   pow(groove.left.get( density * ( n + j ) ) * amp, power);
      value = pow(groove.left.get( density * i) * amp, power) +
        pow(groove.left.get( bufferSize - 1  - density * j ) * amp, power);
      value = pow(value, enhance) + random(15);
      y[i][j] = y[i][j] - ( y[i][j] - value ) * damp;
    }
  }

  for(int i = -n / 2; i < n / 2 ; i++) {
    for (int j = -n / 2; j < n / 2; j++) {
      point(p_distance * i, y[ i + n / 2 ][ j + n / 2 ], p_distance * j);
      //point(p_distance * i, 0,  p_distance * j);
    }
  }

}



void keyPressed() {
//   if (key == 'a') {
//     offsetAngle = offsetAngle + 10;
//   }
//   if (key == 's') {
//     offsetAngle = offsetAngle - 10;
//   }
//   if (key == 'x') {
//     x_rotate = !x_rotate;
//   }
//   if (key == 'y') {
//     y_rotate = !y_rotate;
//   }
//   if (key == 'z') {
//     z_rotate = !z_rotate;
//   }
//
  if (key == 'l') {
    if (loop) {
      loop = false;
      noLoop();
    }
    else {
      loop = true;
      loop();
    }
  }
}
