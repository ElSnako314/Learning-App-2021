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
public Button cation1, cation2, anion1, anion2;

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
    textSize(30);
    list.displayIons(displayCation, cationButtons);
    ui.whichCation((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
  else if (displacementClicked && step == 2) {
    textSize(30);
    list.displayIons(displayAnion, anionButtons);
    ui.whichAnion((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }  
  else if (displacementClicked && step == 3) {
    textSize(30);
    list.displayIons(displayCation, cationButtons);
    ui.whichCation((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
  else if (displacementClicked && step == 4) {
    textSize(30);
    list.displayIons(displayAnion, anionButtons);
    ui.whichAnion((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
}

public void mouseReleased() {
  if (begin.isClicked()) {
    beginClicked = true;
  }
  if (beginClicked && reactionTypes[0].isClicked()) {
    displacementClicked = true;
    step++;
  }
  if (beginClicked && displacementClicked && step == 1) {
    for (Button[] cationRow : cationButtons) {
      for (Button cation : cationRow) {
        if (cation != null) {
          if (cation.isClicked()) {
            step++;
            cation1 = cation;
          }
        }
      }
    }
  }
  if (beginClicked && displacementClicked && step == 2) {
    for (Button[] anionRow : anionButtons) {
      for (Button anion : anionRow) {
        if (anion != null) {
          if (anion.isClicked()) {
            step++;
            anion1 = anion;
          }
        }
      }
    }
  }  
  if (beginClicked && displacementClicked && step == 3) {
    for (Button[] cationRow : cationButtons) {
      for (Button cation : cationRow) {
        if (cation != null && cation != cation1) {
          if (cation.isClicked()) {
            step++;
            cation2 = cation;
          }
        }
      }
    }
  }
  if (beginClicked && displacementClicked && step == 4) {
    for (Button[] anionRow : anionButtons) {
      for (Button anion : anionRow) {
        if (anion != null && anion != anion1) {
          if (anion.isClicked()) {
            step++;
            anion2 = anion;
          }
        }
      }
    }
  }   
}
