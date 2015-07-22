//from https://github.com/thisisjohnbrown/uncontext#what-do-i-submit

//added import libraries or APIs?
//web socket
//import java.net.URI;
//import java.net.URISyntaxException;

//import org.java_websocket.client.WebSocketClient;
//import org.java_websocket.drafts.Draft_17;
//import org.java_websocket.handshake.ServerHandshake;


//String fakeData = " { {\"name\": \"0\": {\"a\": 14, \"b\": 13} }";





PImage blades;
PImage base;
//declare array of SpinningFan
SpinningFan[] fans = new SpinningFan[25]; // declare array of objects called fans

int fanside;

//private WebSocketClient cc; // added


JSONObject json; //json #1

void setup() {
  size(600, 600);
  blades = loadImage("fan.png");
  base = loadImage("fan_empty.png");

  fanside = base.width;

  //json\  
  json = loadJSONObject("flights.json"); //json #2:opens file, creates a new object, parses data into object 

  JSONArray flights = json.getJSONArray("flights"); //json #3

  for (int i=0; i<flights.size(); i++) {
    JSONObject flight = flights.getJSONObject(i);

    int id = flight.getInt("flightno"); //calling this from file and saving as a variable
    int lat = flight.getInt("latitude"); 
    int lon = flight.getInt("longitude"); 
    int time = flight.getInt("timestamp"); 

////without an array calling just from json one obj
//    int flight = json.getInt("flightno"); //calling this from file and saving as a variable
//    float lat = json.getInt("latitude");
//    float lon = json.getInt("longitude");
//    int time = json.getInt("timestamp");
    println(id + ", " + lat + ", " + lon + "," + time); //using "" to tell other text to a string, java knows through println converts floats or int by parsing into a into string
  }

    //String species = json.getString("species");
    //String name = json.getString("name");

    //setup initial conditoins_
    //myFan = new SpinningFan(100, 100);
    float cols = 5; //play with this # to change # columns

    for (int i=0; i<fans.length; i++) {
      //columns code go from 1d index position to 2d grid position, also used in image
      float rowX = i % cols; // i%col = i remainder (how many times does i go into columns)
      float colY = (i-rowX) / cols; // finds corresponding row

      fans[i] = new SpinningFan(rowX*fanside +fanside/2, colY*fanside + fanside/2); // play w/ these: spaced out by 20, offset by 100
      //fans[i] = new SpinningFan(i*30,100);
      // particles[i] = new Particle();
    }

    //for the API sample
    //try {
    //  //cc = new WebSocketClient( new URI( "ws://literature.uncontext.com:80" ), new Draft_17() ) {

    //    @Override
    //      public void onMessage( String message ) {
    //      try {
    //        JSONObject data = JSONObject.parse(message);
    //        println(data);
    //        //println(data.getInt("d")); // gives you the no d
    //      } 
    //      catch (Exception e) {
    //        println(e);
    //      }
    //    }

    //    @Override
    //      public void onOpen( ServerHandshake handshake ) {
    //      println( "You are connected to uncontext." );
    //    }

    //    @Override
    //      public void onClose( int code, String reason, boolean remote ) {
    //      println( "You have been disconnected from uncontext.: Code: " + code + " " + reason);
    //    }

    //    @Override
    //      public void onError( Exception ex ) {
    //      println(ex);
    //    }
    //  };
    //  cc.connect();
    //} 
    //catch ( URISyntaxException ex ) {
    //  // required
    //}
  }

  void draw() {
    background(0);
    //call display for myFan

    for (int i=0; i<fans.length; i++) {
      fans[i].display();

      //  particles[i].update();
    }
    //myFan.display();
  }

  void mouseMoved() {
    for (SpinningFan thisfan : fans) { //short hand for looping through the array fans and assigning that one the one thisfan
      if (mouseX > thisfan.x-fanside/2 && mouseX < thisfan.x+fanside/2 && 
        mouseY > thisfan.y-fanside/2 && mouseY < thisfan.y+fanside/2) { 
        thisfan.isSpinning = true;
      } else {
        thisfan.isSpinning = false;
      }
    }
  }