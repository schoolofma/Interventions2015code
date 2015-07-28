import processing.net.*;

com.sun.net.httpserver.HttpServer server;

boolean newScan = false;

void setup(){
  try{
    server = com.sun.net.httpserver.HttpServer.create(new java.net.InetSocketAddress(8000), 0);
    MyHandler handler = new MyHandler();
    server.createContext("/test", handler);
    server.setExecutor(null); // creates a default executor
    server.start();
  }
  catch(Exception e){
    println(e);
  }
}

void draw(){
   if(newScan){
     fill(255, random(255), random(255));
     rect(width/2, height/2, random(5, 20), random(5, 20));
     newScan = false;
   }
}

void urlWasClicked(){
  println("SCAN!");
  newScan = true;
}

    