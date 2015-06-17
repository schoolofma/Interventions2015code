
void setup(){
size(1024,768);
background(0);
}



void draw(){
translate(512,768/2);
noFill();
ellipseMode(CENTER); 
ellipse(random (-500), random (-600), 55, 55);


fill(random (255));
ellipseMode(CENTER); 
ellipse(random (-400), random (-1200), 30, 30);


fill(random(255),random(255),random(255));
ellipseMode(CENTER); 
ellipse(random (-400), random (-2000), 10, 10);



ellipseMode(CENTER); 
ellipse(50, -200, 55, 55);


fill(random (255));
ellipseMode(CENTER); 
ellipse(random (1000), random(-2000), 30, 30);


fill(0);
ellipseMode(CENTER); 
ellipse(random(600), random(-1200), 10, 10);

translate(0,-90);
fill(255);
triangle(-10, 0, 0, -20, 10, 0);


fill(random(255), 0, 0, random(100));
translate(0,90);
rectMode(CENTER);
rect(random(-1000),random(-1000),random(900),10);

rectMode(CENTER);
rect(random(600),random(800),10,10);

fill(random(255),random(255),random(255));
translate(0,90);
rectMode(CENTER);
rect(random(1000),random(800),10,10);

}








