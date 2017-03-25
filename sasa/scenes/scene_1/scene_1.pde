// 1.
// Collision Detection
// Use ArrayList to store all the circles
// and an array to ArrayList to detect the circles at specific position
// 2.
// Add the MIDI controller

import themidibus.*;

MidiBus midi;

Circles circles;
float unit = 80;
int nOfR;
int nOfC;

String controller = "APC40 mkII";



color[] colorList = {
  color(219, 10, 91),
  color(236, 236, 236),
  color(68, 108, 179), // SAN MARINO
  color(197, 239, 247), // HUMMING BIRD
  color(44, 62, 80), // MADISON
  color(220, 198, 224),
  color(233, 212, 96), // TRIGGER
  color(243, 156, 18),
  color(46, 204, 113),
};

void setup() {
  size(1920, 1080);
  MidiBus.list();

  nOfC = round(width / unit) + 1;
  nOfR = round(height / unit) + 1;
  println("nOfC : " + nOfC);
  println("nOfR : " + nOfR);
  circles = new Circles();
  midi = new MidiBus(this, controller, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.

}

void draw() {
  // println(frameRate);
  background(colorList[4]);
  // circles.debug();
  circles.render();
}

void mousePressed() {
  circles.mousePressed(mouseX, mouseY);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("frame/####.png");
  }
  circles.keyPressed();
}


void noteOn(Note note) {
  // Receive a noteOn
  circles.noteOn(note);
}

void controllerChange(ControlChange change) {
  circles.controllerChange(change);
}

void noteOff(Note note) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}
