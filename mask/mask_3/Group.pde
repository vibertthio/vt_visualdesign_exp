class Group {
  Vines vines;
  PImage mask;

  boolean drawingMask = false;

  Group() {
    vines = new Vines();
    mask = loadImage("mask2_350.png");
  }

  void render() {
    color col = getColor();
    vines.render(col);

    if (drawingMask) {
      drawMask(col);
    }
  }


  void drawMask(color col) {
    imageMode(CENTER);
    tint(col);
    image(mask, width / 2, height / 2);
  }

  void drawMaskOneTime() {
    imageMode(CENTER);
    image(mask, width / 2, height / 2, 1000, 1000);
  }

  // trigger
  void triggerDrawMask() {
    drawingMask = !drawingMask;
  }

  void keyPressed() {
    if (key == 'q') {
      triggerDrawMask();
    } else if (key == 'w') {
      drawMaskOneTime();
    } else {
      vines.keyPressed();
    }
  }

  void mousePressed() {
    vines.mousePressed();
  }
}
