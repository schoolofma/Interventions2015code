// This code comes from
// https://github.com/thisisjohnbrown/uncontext#what-do-i-submit
// PDX Creative Code group in Portland

import java.net.URI;
import java.net.URISyntaxException;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.drafts.Draft_17;
import org.java_websocket.handshake.ServerHandshake;

// Download java_websocket from https://github.com/TooTallNate/Java-WebSocket/tree/master/dist
// and place into your libraries folder for Processing
// http://wiki.processing.org/w/How_to_Install_a_Contributed_Library

/*
{
  {"name": "0": {
    "a": int (0-25),
    "b": float (1-20.33, to two decimal places),
    "c": int (0 or 1),
    "d": int (1-14),
    "e": {
        "f": int (less than g),
        "g": int (1-467)
    }
}

*/


private WebSocketClient cc;

void setup(){
  try {
    cc = new WebSocketClient( new URI( "ws://literature.uncontext.com:80" ), new Draft_17() ) {

      @Override
      public void onMessage( String message ) {
        try {
          JSONObject data = JSONObject.parse(message);
          println(data);
          //println(data.getInt("d"));
        } catch (Exception e) {
          println(e);
        }
      }

      @Override
      public void onOpen( ServerHandshake handshake ) {
        println( "You are connected to uncontext." );
      }

      @Override
      public void onClose( int code, String reason, boolean remote ) {
        println( "You have been disconnected from uncontext.: Code: " + code + " " + reason);
      }

      @Override
      public void onError( Exception ex ) {
        println(ex);
      }
    };
    cc.connect();
  } catch ( URISyntaxException ex ) {
    // required
  }
}

