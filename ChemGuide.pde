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
//Scene
public int step = 0;
//Selected Buttons, and selected ion charges (for balancing the reaction)
public Button plus1, plus2, minus1, minus2;
public int poscharge1, poscharge2, negcharge1, negcharge2;

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
  ui.setTitleText("Welcome to ChemGuide! Click the Begin button to begin.");
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
    list.displayIons(displayCation, cationButtons, cations);
    ui.whichCation((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
  else if (displacementClicked && step == 2) {
    textSize(30);
    list.displayIons(displayAnion, anionButtons, anions);
    ui.whichAnion((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }  
  else if (displacementClicked && step == 3) {
    textSize(30);
    list.displayIons(displayCation, cationButtons, cations);
    ui.whichCation((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
  else if (displacementClicked && step == 4) {
    textSize(30);
    list.displayIons(displayAnion, anionButtons, anions);
    ui.whichAnion((int) (displayWidth * .5) + 25, 200, displayWidth * .5 - 50, 130, step); 
  }
  if (step == 5) {
    ui.setTitleText("Your reaction has been balanced.");
    ui.Title(25, 25, displayWidth - 50, .15 * displayHeight);
    System.out.println(minus2.getHiddenText());
    System.out.println(negcharge2);
    
  }
}

public void mouseReleased() {
  if (begin.isClicked()) {
    beginClicked = true;
  }
  
  if (beginClicked && reactionTypes[0].isClicked() && step == 0) {
    displacementClicked = true;
    step++;
  }
  
  if (displacementClicked && step == 1) {
    for (Button[] cationRow : cationButtons) {
      for (Button cation : cationRow) {
        if (cation != null) {
          if (cation.isClicked()) {
            plus1 = cation;
            poscharge1 = Integer.parseInt(plus1.getHiddenText());
            step++;
          }
        }
      }
    }
  }
  
  if (displacementClicked && step == 2) {
    for (Button[] anionRow : anionButtons) {
      for (Button anion : anionRow) {
        if (anion != null) {
          if (anion.isClicked()) {
            minus1 = anion;
            negcharge1 = Integer.parseInt(minus1.getHiddenText());
            step++;
          }
        }
      }
    } //<>//
  }
  
  if (displacementClicked && step == 3) {
    for (Button[] cationRow : cationButtons) {
      for (Button cation : cationRow) {
        if (cation != null && !cation.equals(plus1)) {
          if (cation.isClicked()) {
            plus2 = cation;
            poscharge2 = Integer.parseInt(plus2.getHiddenText());
            step++;
          }
        }
      }
    } //<>//
  }
  
  if (displacementClicked && step == 4) {
    for (Button[] anionRow : anionButtons) {
      for (Button anion : anionRow) {
        if (anion != null && !anion.equals(minus1)) {
          if (anion.isClicked()) {
            minus2 = anion;
            negcharge2 = Integer.parseInt(minus2.getHiddenText());
            step++;
          }
        }
      }
    }
  }   
}
