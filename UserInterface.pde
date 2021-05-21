public class UserInterface {
  private int x, y;
  PFont thisFont;

  
  public void Title(int x, int y, float width, float height) {
    //Constructor Portion
    this.x = x;
    this.y = y;
    
    //Draw the title box
    strokeWeight(5);
    stroke(#556B2F);
    fill(#C0FF3E);
    rect(this.x, this.y, width, height);
    
    //Words with new Font
    thisFont = createFont("Bell MT Bold", 48);
    textFont(thisFont);
    fill(#000000);
    textAlign(CENTER);
    text("Welcome to ChemGuide! Begin with the menus below.", (int) (x + (width/20)), (int) (y + (height/4)), (int) ((9.0/10) * width), (int) (height/2));
  }
  
  public void QueryOne(int x, int y, float width, float height) {
    this.x = x;
    this.y = y;
    
    strokeWeight(5);
    stroke(#556B2F);
    fill(#C0FF3E);
    rect(this.x, this.y, width, height);
    
    //Words with new Font
    thisFont = createFont("Bell MT Bold", 36);
    textFont(thisFont);
    fill(#000000);
    textAlign(CENTER);
    text("Which kind of reaction would you like to balance?", x + width/2, y + height/2);
  }
  
  public void whichCation(int x, int y, float width, float height, int step) {
    this.x = x;
    this.y = y;
    String n = "";
    
    strokeWeight(5);
    stroke(#556B2F);
    fill(#C0FF3E);
    rect(this.x, this.y, width, height);
    
    if (step == 1) n = "first";
    else if (step == 3) n = "second";
    thisFont = createFont("Bell MT Bold", 36);
    textFont(thisFont);
    fill(#000000);
    textAlign(CENTER);
    text("In your " + n + " compound, \nwhat is the cation?", x + width/2, y + height/2);
  }
  
  public void whichAnion(int x, int y, float width, float height, int step) {
    this.x = x;
    this.y = y;
    String n = "";
    
    strokeWeight(5);
    stroke(#556B2F);
    fill(#C0FF3E);
    rect(this.x, this.y, width, height);
    
    if (step == 2) n = "first";
    else if (step == 4) n = "second";
    thisFont = createFont("Bell MT Bold", 36);
    textFont(thisFont);
    fill(#000000);
    textAlign(CENTER);
    text("In your " + n + " compound, \nwhat is your anion?", x + width/2, y + height/2);
  }
}
