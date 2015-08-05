class MyHandler implements com.sun.net.httpserver.HttpHandler{  
      @Override
      public void handle(com.sun.net.httpserver.HttpExchange t) throws IOException {
          //String response = "This is the response";
          String response = "<html><head></head><body><p style=\"color:#F00;\">HOLA</p></body></html>";
          t.sendResponseHeaders(200, response.length());
          OutputStream os = t.getResponseBody();
          os.write(response.getBytes());
          os.close();
          
          urlWasClicked();
          
      }
  }