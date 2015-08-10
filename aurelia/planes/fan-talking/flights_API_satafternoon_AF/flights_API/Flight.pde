class Flight{
  String id;
  
  
  //positions - with soma, these used to be [] - replace with array lists
  ArrayList<PVector> coordinates; //UPPERCASE when in array list
  
  ////in order to zoom in, we need to normalize the lat and lon values
  float latMin, lonMin;
  float latMax, lonMax;
  
  Flight(String aFlightId) { //best not to call these x and y so not to be confused
    id = aFlightId; 

    //initialize an empty array list for both lats and lons
    coordinates = new ArrayList<PVector>();
//    currentCoordinate = 0;
    
    latMin = Integer.MAX_VALUE;
    latMax = Integer.MIN_VALUE;
    lonMin = Integer.MAX_VALUE;
    lonMax = Integer.MIN_VALUE;
  }
  
  void addCoordinates(float aLat, float aLong) {
    coordinates.add(new PVector(aLat, aLong));
    
    //update max and min coordinate values:
    //they will allow us to zoom into the path of this flight
    if(aLat > latMax) latMax = aLat;
    if(aLat < latMin) latMin = aLat;
    if(aLong > lonMax) lonMax = aLong;
    if(aLong < lonMin) lonMin = aLong;
  }
  
  String toString(){
    String toPrint = "--------------------------------------------------\n" +
                    "Flight " + id + "\n" + 
                     " [ "; 
    for(int i = 0; i < coordinates.size(); i++){
      toPrint += "(" + coordinates.get(i).x + ", " + coordinates.get(i).y + "), ";
    }
    toPrint += "] \n";
    
    return toPrint;
  }
  
  
}
