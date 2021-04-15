public class userInterface {
  private int x = 25, y = 25;
  private int buttonX, buttonY;
  private boolean pressed = false;

  
  public void Title(float length, float width) {
    strokeWeight(5);
    stroke(#556B2F);
    fill(#C0FF3E);
    rect(x, y, length, width);
    textSize(50);
    fill(#000000);
    text("Welcome to ChemGuide! Begin with the menus below.", 75, 150);
  }
  
  public void beginButton(float length, float width) {
    strokeWeight(3);
    stroke(#556B2F);
    fill(#B3EE3A);
    rect(500, 700, length, width);
    textSize(60);
    fill(#000000);
    text("Begin", 600, 770);
  }
  
  public boolean isClicked() {
    return false;
  }
}
