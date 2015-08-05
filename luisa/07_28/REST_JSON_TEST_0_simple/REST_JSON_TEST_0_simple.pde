

int longitude, latitude;

void setup(){
    String[] json = loadStrings("https://api.flightstats.com/flex/flightstatus/rest/v2/json/flightsNear/45/-125/40/-120?appId=927ec82e&appKey=db433b3835c3e1243047ac0d66a5fea3&maxFlights=5");
    for(String s: json){
       println(s);
    }
    
    saveStrings("data.json", json);
    JSONObject jobj =  loadJSONObject("data.json");
    JSONArray  flightsJSONArray = jobj.getJSONArray("flightPositions");
    
    for(int i = 0 ; i < flightsJSONArray.size() ; i++){
       JSONObject flightObject = flightsJSONArray.getJSONObject(i);
       displayFlight(flightObject);
       JSONArray positionsJSONArray = flightObject.getJSONArray("positions");
       for(int j = 0 ; j < positionsJSONArray.size() ; j++){
         JSONObject position = positionsJSONArray.getJSONObject(j);
         longitude = position.getInt("lon");
         latitude = position.getInt("lat");
       }
    }
    
    
}


void displayFlight(JSONObject flight){
   println("Flight ID:" + flight.getInt("flightId") );
}


void draw(){
}
