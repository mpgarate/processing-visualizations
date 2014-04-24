String getTodaysDate(){
    String y = year() + "";
    String d = day() + "";
    String m = month() + "";

    if (d.length() == 1){
        d = "0" + d;
    }
    if (m.length() == 1){
        m = "0" + m;
    }

    return y + m + d;
}

LinkedList<JSONObject> getTodaysArticles(){
    LinkedList<JSONObject> articles = new LinkedList<JSONObject>();

    String apiKey = "d7ed4fe0d47715c66dc048c98c282319:15:69301670";
    String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?";
    String date_today = getTodaysDate();

    int max_number_of_pages = 7; // gets 30 articles

    int i = 0;
    while (i < max_number_of_pages && articles.size() < 30){
        String request = baseURL + "page=" + i + "&begin_date=" + date_today + "&end_date=" + date_today + "&api-key=" + apiKey;

        println(request);

        //String result = join( loadStrings( request ), "");

        //println( result );

        JSONObject nytData = loadJSONObject(request);

        if (nytData == null){
            break;
        }

        JSONObject results = nytData.getJSONObject("response").getJSONObject("meta");
        //println(nytData);
        int total = results.getInt("hits");
        println ("There have been " + total + " articles so far today.");
        
        articles.add(nytData);
        i++;
    }
    return articles;
}
