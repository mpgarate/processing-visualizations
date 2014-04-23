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

  Article[] articles = new Article[articleList.size()];
  
  int k = 0;
  for (Article a : articleList){
    articles[k] = a;
    k++;
  }

  // print first line

  for (int i = 0; i < articles.length; i++){
    OUTPUT.print("," + i);
  }
  OUTPUT.println(",Type,Title,other");

  // print lines for each article
  Article a1;
  Article a2;
  for (int i = 0; i < articles.length; i++){
    a1 = articles[i];
    OUTPUT.print(i + ",");
    for (int j = 0; j < articles.length; j++){
      a2 = articles[j];

      // a1 and a2 not the same element
      // and they have a word in common
      if (i != j && a1.hasCommonWordWith(a2)){
        //OUTPUT.print(a1.getTitle() + " : " + a2.getTitle());
        OUTPUT.print(a2.getID() + ",");
        //println("common word:" + a1.commonWordWith(a2));
      }
      else{
        OUTPUT.print(",");
      }

    }

    OUTPUT.print("0,");

    OUTPUT.print("\"" + a1.getTitle() + "\",");
    OUTPUT.print("other");
    OUTPUT.println();
  }

  OUTPUT.flush();
  OUTPUT.close();
  println("points have been exported");

}
