public class CompoundList {
  //public int charge;
  public String name, formula;
  public boolean isCation;
  public String displayName;
  
  public JSONArray compileCation(JSONArray jsonarray) {
    JSONArray cations = new JSONArray();
    int count = 0;
    for (int i = 0; i < jsonarray.size(); i++) {
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      int charge = currentCompound.getInt("charge");
      
      if (charge > 0) {
        cations.setJSONObject(count, currentCompound);
        count++;
      }
      System.out.println(count);
    }
    return cations;
  }
  
  public JSONArray compileAnion(JSONArray jsonarray) {
    JSONArray anions = new JSONArray();
    int count = 0;
    for (int i = 0; i < jsonarray.size(); i++) {
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      int charge = currentCompound.getInt("charge");
      
      if (charge < 0) {
        anions.setJSONObject(count, currentCompound);
        count++;
      }
      System.out.println(count);
    }
    return anions;
  }
  
  public ArrayList initializeList(JSONArray jsonarray) {
    ArrayList<String> displayNames = new ArrayList();
    for (int i = 0; i < jsonarray.size(); i++) {
      //Get the JSONObject (the compound database)
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      int charge = currentCompound.getInt("charge");
      formula = currentCompound.getString("name");
      
      //Format the cation
      if (charge > 0) isCation = true;
      else isCation = false;
      
      if (isCation) {
        if (charge == 1) {
          formula = formula + "+";
        }
          displayName = formula;
        if (charge == 2) {
          formula = formula + " ²+";
          displayName = formula;
        }
        if (charge == 3) {
          formula = formula + " ³+";
          displayName = formula;
        }
        if (charge == 4) {
          formula = formula + " 4+";
          displayName = formula;
        }
      }
      else {
        if (charge == -1) {
          formula = formula + "-";
          displayName = formula;
        }
        if (charge == -2) {
          formula = formula + " ²-";
          displayName = formula;
        }
        if (charge == -3) {
          formula = formula + " ³-";
          displayName = formula;
        }
      }
      
      //Format the subscripts
      for (int j = 0; j < formula.length(); j++) {
        if (formula.substring(j, j+1).equals("2")) {
           formula = formula.substring(0, j) + "2" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("3")) {
           formula = formula.substring(0, j) + "3" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("4")) {
           formula = formula.substring(0, j) + "4" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("5")) {
           formula = formula.substring(0, j) + "₅" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("6")) {
           formula = formula.substring(0, j) + "₆" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("7")) {
           formula = formula.substring(0, j) + "7" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("8")) {
           formula = formula.substring(0, j) + "₈" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("9")) {
           formula = formula.substring(0, j) + "₉" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
      }
      
      //Put it into the array
      displayNames.add(i, displayName);
    }
    return displayNames;
  }
  
  public void displayIons(ArrayList<String> formulas, Button[][] ions) {
    int position = 0;
    for (int i = 0; i < ions.length; i++) {
      for (int j = 0; j < ions[0].length; j++) {
        ions[i][j] = new Button(25 + i*130, 200 + j*130, 130, 130, formulas.get(position), 4, #7F0000, #FF7F7F);
        ions[i][j].draw();
        if (position + 1 < formulas.size()) position++;
        else break;
      }
    }
  }
}
