for(int sz = 100; sz > 0; sz = sz - 10) {
  fill(random(255));
  ellipse(width/2, height/2, sz, sz);
}

save("circles.png");
