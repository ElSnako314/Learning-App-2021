//Original Screen
UserInterface ui = new UserInterface();
//First Menu
private int dWidth = 1440, dHeight = 960;
Button begin = new Button((int) (dWidth * .5) - 100, (int) (dHeight * .6) - 80, 200, 160, "Begin", 10, #1E8449, #2ECC71);
private boolean beginClicked = false;
//Second Menu
Button[] reactionTypes = new Button[4];
//Compound Menus
JSONArray ions;
CompoundList list = new CompoundList();
ArrayList displayNames;

public void setup() {
  //Setup Screen
  size(displayWidth, displayHeight);
  //Setup Second Menu Buttons
  reactionTypes[0] = new Button(25, (int) (dHeight * .8), (int) ((dWidth - 50) * .25), (int) (dHeight * .1), "Double Replacement", 10, #1E8449, #2ECC71);
  reactionTypes[1] = new Button(25 + (int) (dWidth * .25), (int) (dHeight * .8), (int) ((dWidth - 50) * .25), (int) (dHeight * .1), "Combustion", 10, #1E8449, #2ECC71);
  reactionTypes[2] = new Button(25 + (int) (dWidth * .5), (int) (dHeight * .8), (int) ((dWidth - 50) * .25), (int) (dHeight * .1), "RedOx", 10, #1D8449, #2ECC71);
  reactionTypes[3] = new Button(25 + (int) (dWidth * .75), (int) (dHeight * .8), (int) ((dWidth - 50) * .25), (int) (dHeight * .1), "Unsure", 10, #1D8449, #2ECC71);
  //Setup Compound List
  ions = loadJSONArray("data.json");
  displayNames = list.initializeList(ions);
}

public void draw() {
  //Background Color and Title
  background(#C9F374);
  ui.Title(25, 25, displayWidth - 50, .15 * displayHeight);
  //Draw First Menu Button
  if (!beginClicked) begin.draw();
  if (beginClicked) {
    ui.QueryOne(25, (int) (dHeight * .3), dWidth - 50, .1 * dHeight);
    for (int i = 0; i < reactionTypes.length; i++) {
      reactionTypes[i].draw();
    }
  }
  
}

public void mouseReleased() {
  if (begin.isClicked()) {
    beginClicked = true;
  }
}
