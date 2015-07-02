size(850, 478);
colorMode(HSB);
PImage img = loadImage("/tmp/hi.jpg");
image(img, 0, 0);

loadPixels();
for(int i=0; i<pixels.length; i++) {
  int c = pixels[i];
  float h = hue(c);
  float s = saturation(c);
  float b = brightness(c);
  pixels[i] = color((h+30)%256, 255, 255);
}
updatePixels();

filter(BLUR, 4);
filter(POSTERIZE, 4);
save("/tmp/hi2.jpg");
