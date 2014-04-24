import java.util.LinkedList;
import java.lang.StringBuilder;

void refreshGraph(){
    
    // fetch data as json from API
    LinkedList<JSONObject> nytDataObjects = getTodaysArticles();

    // write to a CSV file suitable for PolarGraph
    writeJSONtoCSV(nytDataObjects);
    commonSettings(g);
    orX=width/2+30; orY=height/2;  //Center of the graph
    graph=new PolarGraph("nytData.csv",orX,orY,R,w,curv_fact,sep);

    stroke(100);
    stroke(100);
}

void setup(){
    // prepare stopwords
    prepareStopwords();


    size(650,650);

    refreshGraph();
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

    if (second() % 20 == 0){
        refreshGraph();
    }
    fill(0);
    text(total_articles, 40, 620);

    saveFrame("frames/line-######.png");
}
 