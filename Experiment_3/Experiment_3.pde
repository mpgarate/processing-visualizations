import org.json.*;

String apiKey = "d7ed4fe0d47715c66dc048c98c282319:15:69301670";

String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json?";

void setup() {
    getArticles("");
}

void draw() {

}

void getArticles(String query){
    query.replace(" ", "+");

    String request = baseURL + "begin_date=20140423&end_date=20140424&api-key=" + apiKey;

    println(request);

    String result = join( loadStrings( request ), "");

    println( result );
}

// http://api.nytimes.com/svc/search/v1/article?query=O.J.+Simpson&begin_date=19940101&end_date=19960101&api-key=d7ed4fe0d47715c66dc048c98c282319:15:69301670
// http://api.nytimes.com/svc/search/v1/article?query=obama&begin_date=20020101&end_date=20100101&api-key=d7ed4fe0d47715c66dc048c98c282319:15:69301670
// http://api.nytimes.com/svc/search/v2/articlesearch.json?q=obama&facet_field=day_of_week&begin_date=20140101&end_date=20150101&api-key=d7ed4fe0d47715c66dc048c98c282319:15:69301670

// http://api.nytimes.com/svc/search/v1/articlesearch.json?begin_date=20140423&end_date=20140424&api-key=d7ed4fe0d47715c66dc048c98c282319:15:69301670
// http://api.nytimes.com/svc/search/v2/articlesearch.json?begin_date=20140423&end_date=20140424&api-key=d7ed4fe0d47715c66dc048c98c282319:15:69301670