
class Letter {
  PImage img;

  float x, y;
  float rot_x, rot_y, rot_z;
  float my_move=0;
  float my_move2=0;

  //contains the vertex information
  HE_Mesh mesh;
  PShape pipi;

  //tells me which shape is being pressed
  Letter(int shape) {
    x=random(width);
    y=height;
    int whichimg= (int) random(5);//throw a dice that gives a random num between 0-4
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
      creator.setEdge(30); // edge length of the polyhedron
      creator.setType(2);// type of platonian solid, 1 to 5
      mesh=new HE_Mesh(creator); 
      //      noFill();
      //      stroke(150);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==2) {
      HEC_Sphere creator=new HEC_Sphere();
      creator.setRadius(70); 
      creator.setUFacets(16);
      creator.setVFacets(16);
      mesh=new HE_Mesh(creator);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }

    if (shape==3) {
      WB_Point[] points=new WB_Point[121];
      int index = 0;
      for (int j = 0; j < 11; j++) {
        for (int i = 0; i < 11; i++) {
          points[index]=new WB_Point(-200+ i * 40+(((i!=0)&&(i!=10))?random(-20, 20):0), -200+j * 40+(((j!=0)&&(j!=10))?random(-20, 20):0), sin(TWO_PI/20*i)*40+cos(TWO_PI/10*j)*40);
          index++;
        }
      }

      //create triangles from point grid
      WB_Triangle[] tris=new WB_Triangle[200];

      for (int i=0; i<10; i++) {
        for (int j=0; j<10; j++) {
          tris[2*(i+10*j)]=new WB_Triangle(points[i+11*j], points[i+1+11*j], points[i+11*j+11]);
          tris[2*(i+10*j)+1]=new WB_Triangle(points[i+1+11*j], points[i+11*j+12], points[i+11*j+11]);
        }
      }

      HEC_FromTriangles creator=new HEC_FromTriangles();

      creator.setTriangles(tris);
      //alternatively tris can be any Collection<WB_Triangle>
      //      noFill();
      //      stroke(150);
      mesh=new HE_Mesh(creator); 
      updatePshape();
    }



    if (shape==4) {
      HEC_Cylinder creator=new HEC_Cylinder();
      creator.setRadius(10, 10); // upper and lower radius. If one is 0, HEC_Cone is called. 
      creator.setHeight(200);
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
      creator.setEdge(70); // edge length of the polyhedron
      creator.setType(8);// type of archimedean solid, 1 to 13
      println(creator.getName());// retrieve name of current polyhedron

      mesh=new HE_Mesh(creator); 
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==6) {
      HEC_Cone creator=new HEC_Cone();
      creator.setRadius(50).setHeight(150); 
      creator.setFacets(50).setSteps(5);
      creator.setCap(true);
      creator.setReverse(false);// flip cone?
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
        basepoints[i]=new WB_Point(0, 70, 0);
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
      pipi.setTextureUV(i, noise(v.x*0.01, v.z*0.01), noise(v.y*0.01, randomizer)); //noise is a function to generate organic movements
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
  }

  void distort(int modifier) {
    if (mesh.getPolygons().length>1000) {// only works if shape is not complex <1000
      return;
    }

    //    int modifier = code%5;
    if (modifier==0) {

      HEM_Extrude extrude= new HEM_Extrude().setDistance(100);
      mesh.modify(extrude);
      updatePshape();
    }
    if (modifier==1) {
      HEM_Inflate inflate= new HEM_Inflate().setRadius(300).setFactor(2);
      mesh.modify(inflate);
      updatePshape();
    }

    if (modifier==2) {
      HEM_Crocodile croc= new HEM_Crocodile().setDistance(30);
      mesh.modify(croc);
      updatePshape();
    }
    if (modifier==3) {
      P=new WB_Plane(0, 0, 100, 0, 0, 1); 
      L=gf.createLineThroughPoints(0, 0, 0, 1, 1, 1);
      HEM_Bend bendy= new HEM_Bend().setAngleFactor(90).setGroundPlane(P).setBendAxis(L);
      mesh.modify(bendy);
      updatePshape();
    }
    if (modifier==4) {
      HEM_Twist twisty= new HEM_Twist().setTwistAxis(new WB_Line(0, 0, 0, 1, 1, 1)).setAngleFactor(radians(20));
      mesh.modify(twisty);
      updatePshape();
    }
    if (modifier==5) {
      HEM_PunchHoles holes= new HEM_PunchHoles().setWidth(30);

      mesh.modify(holes);

      updatePshape();
    }
    if (modifier==6) {
      translate(400, 400, 0);
      rotateY(mouseX*1.0f/width*TWO_PI);
      HEM_Noise noisy=new HEM_Noise().setDistance(50);
      mesh.modify(noisy);
      updatePshape();
    }
    if (modifier==7) {//stretch
      P=new WB_Plane(0, 0, 0, 1, 1, 0); 
      HEM_Stretch stretch=new HEM_Stretch().setGroundPlane(P).setStretchFactor(2);
      stretch.setPosOnly(false);
      stretch.setStretchFactor(200);

      mesh.modify(stretch);
      updatePshape();
    }
    if (modifier==8) {//moveleftright
      x = random(width);
    }
    if (modifier==9) {//moveupdown
      y = random(height);
    }
    if (modifier==10) {//draw bg to set stagefor 10 secs?
      noStroke();
      fill(random(256));
      for (int i=0; i<1000; i=i+1) {
        rect(random(width), random(height), 2, 2);
      }
    }
  }
}
