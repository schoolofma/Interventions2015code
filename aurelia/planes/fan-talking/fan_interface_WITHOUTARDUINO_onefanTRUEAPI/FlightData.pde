class FlightData {
  String flightId;

  //positions - with soma, these used to be [] - replace with array lists
  ArrayList<Float> lats; //UPPERCASE when in array list
  ArrayList<Float> lons;

////in order to zoom in, we need to normalize the lat and lon values
float latMin, lonMin;
float latMax, lonMax;


  //contructor-remove lat/long arguments so just id
  FlightData(String flightIdArgument) { //best not to call these x and y so not to be confused
    this.flightId = flightIdArgument; // keep this?

    //initialize an empty array list for both lats and lons
    lats = new ArrayList<Float>();
    lons = new ArrayList<Float>();
    
    latMin = 100000;
    latMax = -10000;
    lonMin = 10000;
    lonMax = -10000;
  }
  //add method for to use when calling fFlightData object
  //**Use this add within for loop

  void addCoordinates(float latArg, float lonArg) {
    //println("min: " + lonMin);
    if(latArg > latMax){
      latMax = latArg;
    }
    
    if(latArg < latMin){
      latMin = latArg;
    }
    
    if(lonArg > lonMax){
      lonMax = lonArg;
    }
    
    if(lonArg < lonMin){
      lonMin = lonArg;
    } 
    
    lats.add(latArg); // knows already add
    lons.add(lonArg);
    
    
    //println("min: " + lonMin);
  }
  
  //set area
  //void setArea(){
  //}
  
  ////has 10 positions (is the array.size>9 
  //boolean isInteresting(){ //function that returns a boolean value
  //  return true;
    
  }