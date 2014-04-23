class Article{
  private String wordsStr;
  private HashMap<String,Boolean> words = new HashMap<String,Boolean>();
  private String[] wordsArr;
  private int snippet_index = 7;
  private String snippet;

  private String title;

  private int id;

  public Article(JSONObject jsonObj){
    snippet = jsonObj.getString("snippet");
    title = jsonObj.getJSONObject("headline").getString("main");

    wordsArr = snippet.replaceAll("[^a-zA-Z ]", "").toLowerCase().split("\\s+");

    for (String word : wordsArr){
      if ((word.length() > 2) && (isNotStopword(word))){
        words.put(word,true);
      }
    }
  }

  public String commonWordWith(Article other_article){
    for (String word : wordsArr){
      if (other_article.hasWord(word)){
        return word;
      }
    }
    return null;
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

  public String getSnippet(){
    return this.snippet;
  }
}