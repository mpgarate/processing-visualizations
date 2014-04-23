void writeJSONtoCSV(JSONObject jsonData){
  PrintWriter OUTPUT = createWriter("nytData.csv");

  JSONArray docs = jsonData.getJSONObject("response").getJSONArray("docs");
  /*
  for(int i = 0; i < pointList.size(); ++i){        
    PVector V = (PVector) pointList.get(i);
    OUTPUT.println(V.x + "" + V.y + "," + V.z);  // here we export the coordinates of the vector using String concatenation!
  }
  */

  Article[] articles = new Article[docs.size()];

  for (int i = 0; i < docs.size(); i++){
    Article a = new Article(docs.getJSONObject(i));
    a.setID(i);
    articles[i] = a;
  }

  println("article len: " + docs.size());

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

      if (a1.hasCommonWordWith(a2)){
        //OUTPUT.print(a1.getTitle() + " : " + a2.getTitle());
        OUTPUT.print(a2.getID() + ",");
      }
      else{
        OUTPUT.print(",");
      }

    }
    OUTPUT.print("1,");
    OUTPUT.print("\"" + a1.getTitle() + "\",");
    OUTPUT.print("other");
    OUTPUT.println();
  }

  OUTPUT.flush();
  OUTPUT.close();
  println("points have been exported");

}
