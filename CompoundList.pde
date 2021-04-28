public class CompoundList {
  public int charge;
  public String name, formula;
  public boolean isCation;
  public String displayName;
  ArrayList<String> displayNames = new ArrayList();
  
  public JSONArray compileCation(JSONArray jsonarray) {
    JSONArray cations = new JSONArray();
    int count = 0;
    for (int i = 0; i < jsonarray.size(); i++) {
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      charge = currentCompound.getInt("charge");
      
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
      charge = currentCompound.getInt("charge");
      
      if (charge < 0) {
        anions.setJSONObject(count, currentCompound);
        count++;
      }
      System.out.println(count);
    }
    return anions;
  }
  
  public ArrayList initializeList(JSONArray jsonarray) {
    for (int i = 0; i < jsonarray.size(); i++) {
      //Get the JSONObject (the compound database)
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      charge = currentCompound.getInt("charge");
      formula = currentCompound.getString("name");
      
      //Format the cation
      if (charge > 0) isCation = true;
      else isCation = false;
      
      if (isCation) {
        if (charge == 1) {
          formula = formula + "⁺";
        }
          displayName = formula;
        if (charge == 2) {
          formula = formula + "²⁺";
          displayName = formula;
        }
        if (charge == 3) {
          formula = formula + "³⁺";
          displayName = formula;
        }
        if (charge == 4) {
          formula = formula + "⁴⁺";
          displayName = formula;
        }
      }
      else {
        if (charge == 1) {
          formula = formula + "⁻";
          displayName = formula;
        }
        if (charge == 2) {
          formula = formula + "²⁻";
          displayName = formula;
        }
        if (charge == 3) {
          formula = formula + "³⁻";
          displayName = formula;
        }
      }
      
      //Format the subscripts
      for (int j = 0; j < formula.length(); j++) {
        if (formula.substring(j, j+1).equals("2")) {
           formula = formula.substring(0, j) + "₂" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("3")) {
           formula = formula.substring(0, j) + "₃" + formula.substring(j+1, formula.length());
           displayName = formula;
        }
        if (formula.substring(j, j+1).equals("4")) {
           formula = formula.substring(0, j) + "₄" + formula.substring(j+1, formula.length());
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
           formula = formula.substring(0, j) + "₇" + formula.substring(j+1, formula.length());
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
  
  public void displayIons(String formula, Button[][] ions) {
    for (int i = 0; i < ions.length; i++) {
      for (int j = 0; j < ions[0].length; i++) {
        ions[i][j] = new Button(200 + i*100, 200 + j*100, 100, 100, formula, 4, #7F0000, #FF7F7F);
      }
    }
  }
}
