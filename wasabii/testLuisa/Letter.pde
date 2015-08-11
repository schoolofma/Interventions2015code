
class Letter {
  PImage img;

  float x, y;
  float rot_x, rot_y, rot_z;
  float my_move=0;
  float my_move2=0;
  int currMod;// the id for the mod
  int modFrames;// how many times left to apply the modifier

  //contains the vertex information
  HE_Mesh mesh;
  PShape pipi;

  //tells me which shape is being pressed
  Letter(int shape) {
    x=random(width);
    y=height;

    int whichimg= (int) random(9);//throw a dice that gives a random num between 0-4
    String nameoffile = "tex"+nf(whichimg, 2)+".jpg";
    img=loadImage(nameoffile);

    //    int shape = code%3;
    if (shape==0) {

      HEC_Cube creator=new HEC_Cube();
      creator.setEdge(60); 
      creator.setWidthSegments(4).setHeightSegments(3).setDepthSegments(2);
      mesh=new HE_Mesh(creator); 
      //      noFill();
      //      stroke(150);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==1) {
      HEC_Plato creator=new HEC_Plato();
      creator.setEdge(35); // edge length of the polyhedron
      creator.setType(4);// type of platonian solid, 1 to 5
      mesh=new HE_Mesh(creator); 
      //      noFill();
      //      stroke(150);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==2) {
      HEC_Sphere creator=new HEC_Sphere();
      creator.setRadius(25); 
      creator.setUFacets(16);
      creator.setVFacets(16);
      mesh=new HE_Mesh(creator);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }

    if (shape==3) {
      println("inside shape 3");
      HEC_Torus creator=new HEC_Torus();
      println("creator: " + creator);
      creator.setRadius(20, 90); 
      creator.setTubeFacets(8);
      creator.setTorusFacets(30);
      creator.setTwist(3);
      mesh=new HE_Mesh(creator);
      HET_Diagnosis.validate(mesh);


      updatePshape();
    }



    if (shape==4) {
      HEC_Cylinder creator=new HEC_Cylinder();
      creator.setRadius(14, 14); // upper and lower radius. If one is 0, HEC_Cone is called. 
      creator.setHeight(300);
      creator.setFacets(20).setSteps(10);
      creator.setCap(true, true);// cap top, cap bottom?
      //Default axis of the cylinder is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
      creator.setZAxis(0, 1, 1);

      //      stroke(210, 245, 236);
      mesh=new HE_Mesh(creator); 
     
      
      HET_Diagnosis.validate(mesh);
      updatePshape();


      //      HEC_Octahedron creator=new HEC_Octahedron();
      //      creator.setEdge(200);
      //      mesh=new HE_Mesh(creator);
      //      pipi =render.toFacetedPShape(mesh);
    }
    if (shape==5) {
      HEC_Archimedes creator=new HEC_Archimedes();
      creator.setEdge(20); // edge length of the polyhedron
      creator.setType(10);// type of archimedean solid, 1 to 13
      println(creator.getName());// retrieve name of current polyhedron

      mesh=new HE_Mesh(creator); 
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==6) {
      HEC_Cone creator=new HEC_Cone();
      creator.setRadius(30).setHeight(150); 
      creator.setFacets(20).setSteps(5);
      creator.setCap(true);
      creator.setReverse(true);// flip cone?
      //Default axis of the cone is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
      creator.setZAxis(0, 0, 1);
      //      noFill();

      mesh=new HE_Mesh(creator); 

      HET_Diagnosis.validate(mesh);
      updatePshape();
    }

    if (shape==7) {//polygon
      WB_Point[] basepoints =new WB_Point[6];
      for (int i=0; i<6; i++) {
        basepoints[i]=new WB_Point(0, 55, 0);
        if (i>0) basepoints[i].rotateAbout2PointAxisSelf(Math.PI/3.0*i, 0, 0, 0, 0, 0, 1);
      }

      //create polygon from base points, HEC_Polygon assumes the polygon is planar
      WB_Polygon polygon=gf.createSimplePolygon(basepoints);

      HEC_Polygon poly=new HEC_Polygon();

      poly.setPolygon(polygon);//alternatively polygon can be a WB_Polygon2D
      poly.setThickness(30);// thickness 0 creates a surface
      //      noFill();
      mesh=new HE_Mesh(poly); 
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
  }


  void display() {
    pushMatrix();
    translate(x, y, 0);
    rotateY(rot_y);
    rotateX(rot_x);
    rotateZ(rot_z);


    //    render.drawEdges(mesh);
    //    render.drawFaces(mesh);
    pipi.setStroke(true);
    pipi.setStroke(#FFFFFF);

    shape(pipi);

    popMatrix();
  }

  void updatePshape() {

    pipi = render.toFacetedPShape(mesh);
    PVector v= new PVector();
    float randomizer=random(100);

    int count=pipi.getVertexCount();//counting number of vertices
    for (int i=0; i<count; i++) {  //to go through each single vertex
      pipi.getVertex(i, v); // in v theres the coordinates of one vertex
      //  pipi.setTextureUV(i,random(1),random(1));//(settureuv sets image coordinates for each vertex)
      pipi.setTextureUV(i, noise(v.x*1, v.z*1), noise(v.y*1, randomizer)); //noise is a function to generate organic movements
    }
    pipi.setStroke(false);
    pipi.setTexture(img);
  }


  void update() {

    y=y-noise(my_move)-0.5;
    //-0.5 works only for noise to move postivie and negative directions
    x=x+noise(my_move2)-0.5;


    //noise is giving me a number between0-3
    my_move=my_move+0.1;
    my_move2=my_move2+0.02;
    //+= increase whatever varibles by values on the right
    rot_z += 0.01;
    rot_y +=0.01;
    rot_x+=0.03;

    modFrames=modFrames-1;// counts down
    if (modFrames>0) {//to check if we are done counting down
      dodistort();
    }
  }

  void distort(int modifier) {
    currMod=modifier;
    if (currMod==0||currMod==2||currMod==5) {
      modFrames=2;
    } else {
      modFrames=25;
    }
    println("mode in distort", currMod);
  } 
  void dodistort() {
    if (currMod==0||currMod==2||currMod==5) {
      if (mesh.getPolygons().length>500) {// only works if shape is not complex <1000
        return;
      }
    }
    println("test1", currMod);
    //    int modifier = code%5;
    if (currMod==0) {//2

      HEM_Extrude extrude= new HEM_Extrude().setDistance(10).setRelative(false).setChamfer(1).setHardEdgeChamfer(2).setThresholdAngle(0.05*HALF_PI).setPeak(true);
      mesh.modify(extrude);
      updatePshape();
    }
    if (currMod==1) {//U
      HEM_Inflate inflate= new HEM_Inflate().setRadius(10).setFactor(2).setFactor(3);
      mesh.modify(inflate);
      updatePshape();
    }

    if (currMod==2) {//w
      HEM_Crocodile croc= new HEM_Crocodile().setDistance(5);
      mesh.modify(croc);
      updatePshape();
    }
    if (currMod==3) {//m
      P=new WB_Plane(0, 0, 100, 0, 0, 1); 
      L=gf.createLineThroughPoints(0, 0, 0, 1, 1, 1);
      HEM_Bend bendy= new HEM_Bend().setAngleFactor(0.05).setGroundPlane(P).setBendAxis(L);
      mesh.modify(bendy);
      updatePshape();
    }
    if (currMod==4) {//o
      HEM_Twist twisty= new HEM_Twist().setTwistAxis(new WB_Line(0, 0, 0, 1, 1, 0)).setAngleFactor(radians(0.1));
      mesh.modify(twisty);
      updatePshape();
    }
     println("test1.5", currMod);
    if (currMod==5) {//=
      HEM_PunchHoles holes= new HEM_PunchHoles().setWidth(2);

      mesh.modify(holes);
      updatePshape();
      println("punchy");
    }
    if (currMod==6) {//j
      translate(400, 400, 0);
      rotateY(mouseX*1.0f/width*TWO_PI);
      HEM_Noise noisy=new HEM_Noise().setDistance(10);
      stroke(#FFFFFF);

      mesh.modify(noisy);
      updatePshape();
      println("noisy");
    }

    if (currMod==7) {//r
      //      if (mesh.getPolygons().length>1000) {
      P=new WB_Plane(0, 0, 0, 1, 1, 0);
      HEM_Stretch stretch=new HEM_Stretch();

      stretch.setGroundPlane(P);
      stretch.setStretchFactor(1.05);
      stretch.setPosOnly(false);
      mesh.modify(stretch);
      updatePshape();
      println("stretchy");
      //      } else {
      //        (  P=new WB_Plane(0, 0, 0, 1, 1, 0); 
      //        HEM_Stretch stretch=new HEM_Stretch();
      //        stretch.setGroundPlane(P);
      //        stretch.setStretchFactor(1.05);
      //        stretch.setPosOnly(false);
      //        mesh.modify(stretch);
      //        updatePshape();
      //        println("stretchy");
      //      }
    }
      if (currMod==8) {//move up
        //      x=random(width);
        y += random(0, 20);
      }
      if (currMod==9) {//move down
        //      y = random(height);
        y -= random(0, 20);
      }
      println("test2", currMod);

      if (currMod==10) {//draw bg to set stagefor 10 secs?//m

        noStroke();
        fill(random(256));
        for (int i=0; i<1000; i=i+1) {
          rect(random(width), random(height), 2, 2);
          rect(random(width), random(height), 1, 1);
        }
        fill(255);
        println("bg");
      }
      if (currMod==11) {//move left
        x+=random(0, 20);
        println("left");
      }
      if (currMod==12) {//move right
        x-=random(0, 20);
        println("right");
      }
    
  }
}

