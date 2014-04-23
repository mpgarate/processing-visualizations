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

JSONObject getTodaysArticles(){
    String apiKey = "d7ed4fe0d47715c66dc048c98c282319:15:69301670";

    String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?";


    String date_today = getTodaysDate();

    String request = baseURL + "begin_date=" + date_today + "&end_date=" + date_today + "&api-key=" + apiKey;

    println(request);

    //String result = join( loadStrings( request ), "");

    //println( result );

    JSONObject nytData = loadJSONObject(request);
    JSONObject results = nytData.getJSONObject("response").getJSONObject("meta");
    //println(nytData);
    int total = results.getInt("hits");
    println ("There have been " + total + " articles so far today.");
    
    return results;
}
