
//TALK TO ARDUINO VIA STRING ARDUINO MESSAGE
//fixed to now only send 15 times per second rather than 60 times per second when in draw loop


//ADD SHUFFLE AFTER 5 SEC WAIT, THEN WAIT 2 SEC.
//NOadd in fan class, a void default
//add in void draw, in //animat if:


//FIX FLIGHT PATH

//ADD REPLAY OF LAST SAVED DATA IF NO NEW DATA FOR > 5 SEC
if (flights.size()<0){ // OR (flightArray.size()<0) OR currnetFlight.coordinates.size<0
    JSONObject json = loadJSONObject(query2); //within void getNewData? OR in moveToNextFlightPosition & in API global vars, String query2 = Stystem.recentTime() + ".json")
    

}


//PRINT FLIGHT ID AS STRING TO EXTERNAL DISPLAY