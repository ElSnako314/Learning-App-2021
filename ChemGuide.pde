//Origina Screen
userInterface ui = new userInterface();
//First Menu
private int dWidth = 1440, dHeight = 960;
Button begin = new Button((int) (dWidth * .5) - 100, (int) (dHeight * .6) - 80, 200, 160, "Begin", 10, #1E8449, #2ECC71);
private boolean beginClicked = false;
//Second Menu

public void setup() {
  size(displayWidth, displayHeight);
}

public void draw() {
  background(#C9F374);
  ui.Title(25, 25, displayWidth - 50, .15 * displayHeight);
  if (!beginClicked) begin.draw();
}

public void mouseReleased() {
  if (begin.isClicked()) {
    beginClicked = true;
  }
}
