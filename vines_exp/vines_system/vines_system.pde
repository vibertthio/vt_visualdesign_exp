ArrayList<Vines> vines;

void setup() {
  size(1920, 1080);
  vines = new ArrayList<Vines>();
}

void draw() {
  background(0);
  for (Vines v : vines) {
    v.update();
    v.render();
  }
}


void mousePressed() {
  vines.add(new Vines(mouseX, mouseY, 0, 3));
  vines.add(new Vines(mouseX, mouseY, PI / 2, 3));
  vines.add(new Vines(mouseX, mouseY, PI, 3));
  vines.add(new Vines(mouseX, mouseY, - PI / 2, 3));

}
