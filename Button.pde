import java.awt.Rectangle;

public class Button {
  public int x, y, w, h;
  public int stroke;
  public color c1, c2;
  public String title, text;
  public Rectangle clickArea;
  
  public Button(int x, int y, int w, int h, String title, int stroke, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.title = title;
    this.c1 = c1;
    this.c2 = c2;
    this.clickArea = new Rectangle(x,y,w,h);
  }
  
  public void setText(String text) {
    this.text = text;
  }
  
  public void draw() {
    fill(c1);
    rect(x,y,w,h);
    
    fill(0);
    textAlign(CENTER);
    text(title, x+w/2, y+h/2);
  }
  
  public boolean isClicked() {
    return this.clickArea.contains(mouseX,mouseY);
  }
}
