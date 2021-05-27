import java.awt.Rectangle;

public class Button {
  public int x, y, w, h;
  public int stroke;
  public color c1, c2;
  //hiddenText is used to store the charge of the compounds that enter as buttons
  public String title, hiddenText;
  public Rectangle clickArea;
  
  public Button(int x, int y, int w, int h, String title, int stroke, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    this.stroke = stroke;
    this.c1 = c1;
    this.c2 = c2;
    this.clickArea = new Rectangle(x,y,w,h);
  }
  
  public Button(int x, int y, int w, int h, String title, int stroke, color c1, color c2, String hiddenText) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    this.stroke = stroke;
    this.c1 = c1;
    this.c2 = c2;
    this.clickArea = new Rectangle(x,y,w,h); 
    this.hiddenText = hiddenText;
  }
  
  public String getTitle() {
    return title;
  }
  
  public void setTitle(String title) {
    this.title = title;
  }
  
  public String getHiddenText() {
    return hiddenText;
  }
  
  public void draw() {
    strokeWeight(stroke);
    stroke(c1);
    fill(c2);
    rect(x,y,w,h);
    
    fill(0);
    textAlign(CENTER);
    text(title, x+w/2, y+h/2);
  }
  
  public boolean isClicked() {
    return this.clickArea.contains(mouseX,mouseY);
  }
}
