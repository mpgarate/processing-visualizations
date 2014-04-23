
void setup(){
    // prepare stopwords
    prepareStopwords();

    // prepare NYT data
    
    // fetch data as json from API
    JSONObject nytData = getTodaysArticles();

    // write to a CSV file suitable for PolarGraph
    writeJSONtoCSV(nytData);

    // polargraph
    size(650,650);
    commonSettings(g);
    orX=width/2+30; orY=height/2;  //Center of the graph
    graph=new PolarGraph("nytData.csv",orX,orY,R,w,curv_fact,sep);
}
 
void draw(){

    // polargraph
    background(bg);        
    graph.displayBase();                              //shows the polar display of elements
    graph.creaConnect();                              //check selected connections and show them
    if (graph.hover(dist(mouseX,mouseY,orX,orY))){    //show hovered connections
    cursor(HAND);
    graph.creaConnect(atan2((mouseY-orY),(mouseX-orX)));
    }else{
    cursor(CROSS);
    }
}
 