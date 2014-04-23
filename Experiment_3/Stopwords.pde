String stopwords_str = "about all along also although among and any anyone anything are around because "
+ "been before being both but came come coming could did each else every for from "
+ "get getting going got gotten had has have having her here hers him his how "
+ "however into its like may most next now only our out particular same she "
+ "should some take taken taking than that the then there these they this those "
+ "throughout too took very was went what when which while who why will with "
+ "without would yes yet you your"

+ "com doc edu encyclopedia fact facts free home htm html http information "
+ "internet net new news official page pages resource resources pdf site "
+ "sites usa web wikipedia www"
+ "one ones two three four five six seven eight nine ten tens eleven twelve "
+ "dozen dozens thirteen fourteen fifteen sixteen seventeen eighteen nineteen "
+ "twenty thirty forty fifty sixty seventy eighty ninety hundred hundreds "
+ "thousand thousands million millions";

String[] stopwords_arr;

HashMap<String,Boolean> stopwords = new HashMap<String,Boolean>();
void prepareStopwords(){
  stopwords_arr = stopwords_str.split(" ");

  for (String w : stopwords_arr){
    stopwords.put(w,true);
  }
}

Boolean isNotStopword(String word){
  return !stopwords.containsKey(word);
}