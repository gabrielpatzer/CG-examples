void setup(){
  size(800,600);
  colorMode(HSB,width,height,100);
  rectMode(CENTER);
  strokeWeight(3);
}

void draw(){
  background(0,0,75);
  fill(mouseX,mouseY,80);
  rect(width/2,height/2,300,300);
}
