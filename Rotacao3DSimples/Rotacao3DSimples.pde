float a = 0.0;
PFont f;
// direção da rotação:
//    0 = rotX
//    1 = rotY
//    2 = rotZ
int direcao = 0;

void setup() {
  size(500, 500, P3D);
  f = createFont("Arial",20,true);
  textFont(f,20);
  textAlign(CENTER);
  colorMode(RGB, 1); 
}

void mouseClicked(){
  direcao ++;
  if (direcao == 3)
    direcao = 0;
}
void draw() {  
  background(0.5);
  
  fill(1);
  if (direcao == 0)
    text("rotacionando em X",width/2,60);
  else if (direcao == 1)
    text("rotacionando em Y",width/2,60);
  else 
    text("rotacionando em Z",width/2,60);
  
  a += 0.01;
  if(a > TWO_PI) { 
    a = 0.0; 
  }
  
  pushMatrix();
  translate(width/2, height/2);
  
  // aplica a rotação no eixo atual
  if (direcao == 0)
    rotateX(a);
  else if (direcao == 1)
    rotateY(a);
  else 
    rotateZ(a);
    
  scale(80);
  // Cubo gay
  beginShape(QUADS);

  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);

  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  fill(0, 0, 0); vertex(-1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(0, 1, 1); vertex(-1,  1,  1);

  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  endShape();
  popMatrix();
}
