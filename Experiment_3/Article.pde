class Article{
  private String wordsStr;
  private HashMap<String,Boolean> words = new HashMap<String,Boolean>();
  private String[] wordsArr;
  private int snippet_index = 7;

  private String title;

  private int id;

  public Article(JSONObject jsonObj){
    wordsStr = jsonObj.getString("snippet");
    title = jsonObj.getJSONObject("headline").getString("main");

    wordsArr = wordsStr.replaceAll("[^a-zA-Z ]", "").toLowerCase().split("\\s+");

    for (String word : wordsArr){
      words.put(word,true);
    }
  }

  public Boolean hasCommonWordWith(Article other_article){
    for (String word : wordsArr){
      if (other_article.hasWord(word)){
        return true;
      }
    }
    return false;
  }

  public Boolean hasWord(String word){

    if (words.containsKey(word)){
      return true;
    }
    else {
      return false;
    }
  }


  public String getTitle(){
    return this.title;
  }

  public void setID(int i){
    this.id = i;
  }

  public int getID(){
    return this.id;
  }
}