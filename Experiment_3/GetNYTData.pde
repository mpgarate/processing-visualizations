public String total_articles = "";

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

    String apiKey = INSERT_API_KEY_HERE;
    String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?";
    String date_today = getTodaysDate();

    int max_number_of_pages = 5; // gets 50 articles

    int i = 0;
    while (i < max_number_of_pages){
        String request = baseURL + "page=" + i + "&begin_date=" + date_today + "&end_date=" + date_today + "&api-key=" + apiKey;

        println(request);

        //String result = join( loadStrings( request ), "");

        //println( result );

        JSONObject nytData;
        try{
            nytData = loadJSONObject(request);
        }
        catch(Exception e){
            println("Failed to read from NYT.");
            continue;
        }

        if (nytData == null){
            break;
        }

        JSONObject results = nytData.getJSONObject("response").getJSONObject("meta");
        //println(nytData);
        int total = results.getInt("hits");
        total_articles = "There have been " + total + " articles so far today.";
        
        articles.add(nytData);
        i++;
    }
    return articles;
}
