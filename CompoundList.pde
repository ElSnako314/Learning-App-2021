public class CompoundList {
  public int charge;
  public String name, formula;
  public boolean isCation;
  public String displayName;
  ArrayList<String> displayNames = new ArrayList();
  
  public ArrayList initializeList(JSONArray jsonarray) {
    for (int i = 0; i < jsonarray.size(); i++) {
      //Get the JSONObject (the compound database)
      JSONObject currentCompound = jsonarray.getJSONObject(i);
      charge = currentCompound.getInt("charge");
      name = currentCompound.getString("id");
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
  
  public void cationMenu(ArrayList list) {
  
  }
}
