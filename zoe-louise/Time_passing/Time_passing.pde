Void setup (){
Size (600, 600);
}
void draw () {
background (255);
if (frameCount < 100) {
fill(0);
textSize (100); 
text (“third kind”, 20, 220);
}
if (frameCount > 200 && frameCount < 300) {
text (“… Time passing…” , 20, 220);
}
}