void setup(){
  size(250,200);
}

void draw(){
  int i=0;
  while(i < width){
    stroke(i);
    line(i,0,i,height);
    i++;
  }
}
