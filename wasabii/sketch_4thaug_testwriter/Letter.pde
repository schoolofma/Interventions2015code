
class Letter {
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
    //    int shape = code%3;
    if (shape==0) {

      HEC_Cube creator=new HEC_Cube();
      creator.setEdge(60); 
      creator.setWidthSegments(4).setHeightSegments(3).setDepthSegments(2);
      mesh=new HE_Mesh(creator); 
      noFill();
      stroke(150);
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==1) {
      HEC_Plato creator=new HEC_Plato();
      creator.setEdge(100); // edge length of the polyhedron
      creator.setType(2);// type of platonian solid, 1 to 5
      mesh=new HE_Mesh(creator); 
      noFill();
      stroke(150);
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
      noFill();
      stroke(150);
      mesh=new HE_Mesh(creator); 
      updatePshape();
    }



    if (shape==4) {
      HEC_Cylinder creator=new HEC_Cylinder();
      creator.setRadius(10, 10); // upper and lower radius. If one is 0, HEC_Cone is called. 
      creator.setHeight(400);
      creator.setFacets(20).setSteps(10);
      creator.setCap(true, true);// cap top, cap bottom?
      //Default axis of the cylinder is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
      creator.setZAxis(0, 1, 1);
      fill(173, 232, 217);
      stroke(210, 245, 236);
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
      creator.setEdge(100); // edge length of the polyhedron
      creator.setType(8);// type of archimedean solid, 1 to 13
      println(creator.getName());// retrieve name of current polyhedron
      noFill();
      mesh=new HE_Mesh(creator); 
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==6) {
      HEC_Cone creator=new HEC_Cone();
      creator.setRadius(50).setHeight(150); 
      creator.setFacets(500).setSteps(5);
      creator.setCap(true);
      creator.setReverse(false);// flip cone?
      //Default axis of the cone is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
      creator.setZAxis(0, 0, 1);
      mesh=new HE_Mesh(creator); 
      HET_Diagnosis.validate(mesh);
      updatePshape();
    }
    if (shape==7) {
      stroke(10);
      ellipse(width/2, height/2, sz, sz);
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
  }


  void update() {

    y=y-noise(my_move);
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
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==1) {
      HEM_Inflate inflate= new HEM_Inflate().setRadius(300).setFactor(2);
      mesh.modify(inflate);
      pipi =render.toFacetedPShape(mesh);
    }

    if (modifier==2) {
      HEM_Crocodile croc= new HEM_Crocodile().setDistance(30);
      mesh.modify(croc);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==3) {
      HEM_Bend bendy= new HEM_Bend().setAngleFactor(90);
      mesh.modify(bendy);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==4) {
      HEM_Twist twisty= new HEM_Twist().setTwistAxis(new WB_Line(0, 0, -1, 0, 0, 1)).setAngleFactor(radians(20));
      mesh.modify(twisty);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==5) {
      HEM_PunchHoles holes= new HEM_PunchHoles().setWidth(30);
      fill(150);
      stroke(255);
      mesh.modify(holes);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==6) {
      translate(400, 400, 0);
      rotateY(mouseX*1.0f/width*TWO_PI);
      HEM_Noise noisy=new HEM_Noise().setDistance(50);
      mesh.modify(noisy);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==7) {//stretch
      P=new WB_Plane(0, 0, 0, 1, 1, 0); 
      HEM_Stretch stretch=new HEM_Stretch().setGroundPlane(P).setStretchFactor(2);
      stretch.setPosOnly(false);
      stretch.setStretchFactor(200);

      mesh.modify(stretch);
      pipi =render.toFacetedPShape(mesh);
    }
    if (modifier==8) {//stretch

    }
  }
}

