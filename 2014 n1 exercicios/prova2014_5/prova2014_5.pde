float posX, posY, spdX, spdY;

void setup(){
  size(800,600);
  strokeWeight(3);
  posX = width/2;
  posY = height/2;
  spdX = 4*random(-1,1);
  spdY = 4*random(-1,1);
}

void draw(){
  background(190);
  
  ellipse(posX,posY,150,150);

  
  if (posX+spdX > width-75 || posX+spdX < 75)
    spdX *= -1;
  if (posY+spdY > height-75 || posY+spdY < 75)
    spdY *= -1;
  posX += spdX;
  posY += spdY;

}
