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

color c1 = color(219, 10, 91);
color c2 = color(236, 236, 236);
color c3 = color(68, 108, 179); // SAN MARINO
color c4 = color(197, 239, 247); // HUMMING BIRD
color c5 = color(44, 62, 80); // MADISON
color c6 = color(220, 198, 224);
color c7 = color(233, 212, 96); // TRIGGER

void setup() {
  size(800, 400);
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
  background(c5);
  circles.render();
}

void mousePressed() {
  circles.mousePressed(mouseX, mouseY);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("frame/####.png");
  }

  if (key == 'd') {
  }
}


void noteOn(Note note) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
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
void controllerChange(ControlChange change) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+change.channel());
  println("Number:"+change.number());
  println("Value:"+change.value());
}
