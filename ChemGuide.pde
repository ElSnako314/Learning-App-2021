userInterface ui = new userInterface();
//Button begin = new Button(0, 0, 0, 0, 0, 0, 0, 0);

public void setup() {
  size(displayWidth, displayHeight);
}

public void draw() {
  background(#C9F374);
  ui.Title(25, 25, displayWidth - 50, .15 * displayHeight);
}

public void mouseReleased() {
  System.out.println(displayWidth + " " + displayHeight);
}
