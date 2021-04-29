//Original Screen
UserInterface ui = new UserInterface();
//First Menu
private int dWidth = 1440, dHeight = 960;
Button begin = new Button((int) (dWidth * .5) - 100, (int) (dHeight * .6) - 80, 200, 160, "Begin", 10, #1E8449, #2ECC71);
private boolean beginClicked = false;
//Second Menu
Button[] reactionTypes = new Button[4];
private boolean displacementClicked = false;
//Compound Menus
JSONArray ions, cations, anions;
CompoundList list = new CompoundList();
ArrayList displayCation, displayAnion;
Button[][] cationButtons = new Button[5][5];
Button[][] anionButtons = new Button[5][5];
public int step = 0;

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
  cations = list.compileCation(ions);
  anions = list.compileAnion(ions);
  displayCation = list.initializeList(cations);
  displayAnion = list.initializeList(anions);
}

public void draw() {
  //Background Color and Title
  background(#C9F374);
  ui.Title(25, 25, displayWidth - 50, .15 * displayHeight);
  //Draw First Menu Button
  if (!beginClicked) begin.draw();
  if (beginClicked) {
    for (int i = 0; i < reactionTypes.length; i++) {
      if (!displacementClicked) {
        ui.QueryOne(25, (int) (dHeight * .3), dWidth - 50, .1 * dHeight);
        reactionTypes[i].draw();
      }
    }
  }
  //Double Displacement Menu
  if (displacementClicked && step == 1) {
    //Initialize Button[][]s
    textSize(36);
    list.displayIons(displayCation, cationButtons);
  }
  else if (displacementClicked && step == 2) list.displayIons(displayAnion, anionButtons);
  else if (displacementClicked && step == 3) list.displayIons(displayCation, cationButtons);
  else if (displacementClicked && step == 4) list.displayIons(displayAnion, anionButtons);
}

public void mouseReleased() {
  if (begin.isClicked()) {
    beginClicked = true;
  }
  if (beginClicked && reactionTypes[0].isClicked()) {
    displacementClicked = true;
    step++;
  }
  //if
}
