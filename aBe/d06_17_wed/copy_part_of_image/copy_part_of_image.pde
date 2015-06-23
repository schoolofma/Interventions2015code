size(600, 600);

PImage img = loadImage("http://lorempixel.com/600/600/#.jpg");

// put left part of the image on the right
copy(img,    0, 0, 300, 600,     300, 0, 300, 600);

// put right part of the image on the left
copy(img,    300, 0, 300, 600,   0, 0, 300, 600);

save("swapped_sides.jpg");
