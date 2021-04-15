userInterface ui = new userInterface();

public void setup() {
  size(displayWidth, displayHeight);
  
}

public void draw() {
  background(#C9F374);
  ui.Title(displayWidth - 50, .2 * displayHeight);
  ui.beginButton(.25 * displayWidth, .1 * displayHeight);
}

public void mouseReleased() {
  System.out.println("HOLA WORLD");
}
