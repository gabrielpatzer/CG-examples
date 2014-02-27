float coluna;
void setup(){
  size(400,400);
  colorMode(GRAY);
}
void draw(){
  background(127);
  stroke(0);
  line(coluna,0,coluna++,height);
  if (coluna == width) coluna =0;
}
