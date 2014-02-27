PFont f;
float corFixa=0.5;

void setup() {
  size(500, 500);
  f = createFont("Arial",20,true);
  textFont(f,14);
  textAlign(LEFT);
  colorMode(RGB, 1); 
}

void draw() {  
  // altura = vermelho
  // largura = verde
  float cor1 = (float)mouseY/height;
  float cor2 = (float)mouseX/width;
  background(cor1,cor2,corFixa);
  
  fill(1);
  rect(0,0,150,80);
  fill(0);
  text("vermelho = "+cor1,20,20);
  text("verde = "+cor2,20,40);
  text("azul = "+corFixa,20,60);
}
