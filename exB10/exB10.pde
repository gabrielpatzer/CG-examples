float posX, posY, spdX, spdY;
int cor;
PImage imagem;

void setup(){
  imagem = loadImage("trees.jpg");
  size(611,404);
  colorMode(HSB);
  posX = width/2;
  posY = height/2;
  spdX = 4*random(-1,1);
  spdY = 4*random(-1,1);
  cor = (int)random(0,255);
}

void draw(){
  background(imagem);
  
  stroke(0,0,180,150);
  fill(cor/255,125,150,127);
  ellipse(posX,posY,50,50);

  
  if (posX+spdX > width-25 || posX+spdX < 25)
    spdX *= -1;
  if (posY+spdY > height-25 || posY+spdY < 25)
    spdY *= -1;
  posX += spdX;
  posY += spdY;
  cor+=random(10,30);
}
