
void setup(){
  size(650,650);
  commonSettings(g);
  orX=width/2+30; orY=height/2;  //Center of the graph
  graph=new PolarGraph("data/tabla.csv",orX,orY,R,w,curv_fact,sep);
}
 
void draw(){
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
 