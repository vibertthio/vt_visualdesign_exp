class Vines {
  PGraphics pg;
  PShader shade;
  private int indexOfShade = 0;
  private ArrayList<Vine> vines;

  private int maxNOfVines = 1000;
  private boolean shaderOn = false;

  Vines() {
    vines = new ArrayList<Vine>();
    pg = createGraphics(width, height);
    shade = loadShader(shaders[indexOfShade]);
    // shader(shade);
  }

  void render() {
    _render(getColor());
  }

  void render(color col) {
    _render(col);
  }

  void _render(color col) {
    setShaderParameters(indexOfShade, shade);
    while (vines.size() > maxNOfVines) {
      vines.remove(0);
    }
    pg.beginDraw();

    pg.noStroke();
    pg.stroke(col);
    for (int i = 0, n = vines.size(); i < n; i++) {
      vines.get(i).render(pg);
    }
    pg.endDraw();

    imageMode(CENTER);
    image(pg, width / 2, height / 2);
  }


  void trigger() {
    for (int i = 0, n = vines.size(); i < n; i++) {
      vines.get(i).trigger();
    }
  }

  void clear() {
    pg.beginDraw();
    pg.background(0);
    pg.endDraw();
    vines.clear();
  }

  void mousePressed() {
    int number = 10;
    while(number-- > 0) {
      vines.add(new Vine(mouseX, mouseY));
    }
  }

  void keyPressed() {
    if (key == ' ') {
      background(0);
    }
    if (key == 'r') {
      clear();
    }
    if (key == 'a') {
      trigger();
    }
    if (key == '1') {
      switchShader(0);
      trigger();
    }
    if (key == '2') {
      switchShader(1);
    }
    if (key == '3') {
      switchShader(-1);
    }
  }

  void switchShader(int index) {
    if (index == -1) {
      resetShader();
      return;
    }
    indexOfShade = index;
    shade = loadShader(shaders[indexOfShade]);
    shader(shade);
  }
}
