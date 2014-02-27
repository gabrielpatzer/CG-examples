float linha;
void setup(){
  size(400,400);
  colorMode(GRAY);
}
void draw(){
  background(127);
  stroke(0);
  line(0,linha,width,linha++);
  if (linha == height) linha =0;
}
