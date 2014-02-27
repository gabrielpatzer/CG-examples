void setup(){
  size(300,300);
  colorMode(RGB);
}

void draw(){
  target(width/2,height/2,100);
}

void target(int x, int y, int tam){
  fill(255,0,0);
  ellipse(x,y,tam,tam);
  fill(255,255,255);
  ellipse(x,y,tam*3/4,tam*3/4);
  fill(255,0,0);
  ellipse(x,y,tam/2,tam/2);
  fill(255,255,255);
  ellipse(x,y,tam/4,tam/4);
}
