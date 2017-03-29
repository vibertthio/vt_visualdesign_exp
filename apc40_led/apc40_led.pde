import themidibus.*; //Import the library
MidiBus myBus; // The MidiBus
int count = 0;
int nOfC = 8;
int nOfR = 5;

int adjustingRow = 0;

void setup() {
  size(400, 400);
  background(0);
  MidiBus.list();
  myBus = new MidiBus(this, "APC40 mkII", "APC40 mkII"); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.
}

void draw() {
  // sendNote(0, 0, 9);
  // lightUpRow(0, 9);
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  if (pitch >= 82 && pitch <= 86) {
    adjustingRow = -1 * (pitch - 86);
    println("switch to : " + adjustingRow);
  }
}

void noteOff(int channel, int pitch, int velocity) {
        // Receive a noteOff
        println();
        println("Note Off:");
        println("--------");
        println("Channel:"+channel);
        println("Pitch:"+pitch);
        println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  if (number == 16) {
    lightUpRow(adjustingRow, value);
  }
}


void lightUpRow(int indexOfRow, int colorIndex) {
  for (int i = 0; i < nOfC; i++) {
    sendNote(0, i + indexOfRow * nOfC, colorIndex);
  }
}
void sendNote(int channel, int pitch, int velocity) {
  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(100);
  // myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
}
