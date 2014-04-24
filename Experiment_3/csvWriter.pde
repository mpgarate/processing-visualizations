void writeJSONtoCSV(LinkedList<JSONObject> jsonPages){
  PrintWriter OUTPUT = createWriter("nytData.csv");

  LinkedList<Article> articleList = new LinkedList<Article>();

  for (JSONObject jsonData : jsonPages){
    JSONArray docs = jsonData.getJSONObject("response").getJSONArray("docs");


    for (int i = 0; i < docs.size(); i++){
      Article a = new Article(docs.getJSONObject(i));
      a.setID(i);
      articleList.add(a);
    }
  }

  LinkedList<Article> unitedArticles = new LinkedList<Article>();

  for (Article a1 : articleList){
    for (Article a2 : articleList){
      if (a1 != a2 && a1.hasCommonWordWith(a2)){
        unitedArticles.add(a1);
        break;
      }
    }
  }

  Article[] articles = new Article[unitedArticles.size()];


  int k = 0;
  for (Article a : unitedArticles){
    articles[k] = a;
    k++;
  }

  // print first line

  for (int i = 0; i < articles.length; i++){
    OUTPUT.print("," + i);
  }
  OUTPUT.println(",Type,Title,snippet,common words");

  // print lines for each article
  Article a1;
  Article a2;
  StringBuilder sb;

  for (int i = 0; i < articles.length; i++){
    a1 = articles[i];
    sb = new StringBuilder();
    sb.append("Common words: ");
    OUTPUT.print(i + ",");
    for (int j = 0; j < articles.length; j++){
      a2 = articles[j];

      // a1 and a2 not the same element
      // and they have a word in common
      if (a1 != a2 && a1.hasCommonWordWith(a2)){
        //OUTPUT.print(a1.getTitle() + " : " + a2.getTitle());
        OUTPUT.print(a2.getID() + ",");

        sb.append(a1.commonWordWith(a2));
        sb.append(",");
      }
      else{
        OUTPUT.print(",");
      }

    }

    OUTPUT.print("0,");
    OUTPUT.print("\"" + a1.getTitle() + "\",");
    //OUTPUT.print("\"" + a1.getSnippet().replace(",","\",\"") + "\"");
    //OUTPUT.print("\"" + sb.toString() + "\"");
    OUTPUT.println();
  }

  OUTPUT.flush();
  OUTPUT.close();
  println("points have been exported");

}
