float passo=0;
int modo=0;

void setup(){
  size(400,400);
  colorMode(GRAY);
}
void mouseClicked(){
  modo++;
}
void draw(){
  background(127);
  stroke(0);
  
  if (modo % 2 == 0){
    line(0,passo,passo++,0);
    if (passo > 2*height-1) passo = 0;
  }
  else{
    line(width-passo,0,width,passo++);
    if (passo > 2*height-1) passo = 0;
  }
}
