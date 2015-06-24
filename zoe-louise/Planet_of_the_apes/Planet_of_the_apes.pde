PImage back;

void setup () {
  size (600, 352);
  back = loadImage ("4911890858_f181f521f1_z.jpeg");
  for (int x=0; x<width; x=x +5) {
    line (0, 0, x, height);
  }
}
void draw () {

  image (back, 0, 0);
 
  }