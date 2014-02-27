float aX = 0.0;
float aY = 0.0;
float aZ = 0.0;
PFont f;
float speed = 0.05;
// direção da rotação:
//    0 = rotX
//    1 = rotY
//    2 = rotZ
int direcao = 0;

void setup() {
  size(500, 500, P3D);
  ortho();
  f = createFont("Arial",20,true);
  textFont(f,20);
  textAlign(CENTER);
  colorMode(RGB, 1); 
   camera(50.0, -50.0, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
}

// Controle da rotação pelo teclado:
// 'q' e 'w' controlam rotação em X
// 'a' e 's' controlam rotação em Y
// 'z' e 'x' controlam rotação em Z
// ' ' Spacebar reseta o cubo
void keyPressed(){
  if (key == 'q'){
    aX -= speed;
    if (aX < 0.0){
      aX = TWO_PI;
    }
  } else if (key == 'w'){
    aX += speed;
    if (aX > TWO_PI){
      aX = 0.0;
    }
  } else if (key == 'a'){
    aY -= speed;
    if (aY < 0.0){
      aY = TWO_PI;
    }
  } else if (key == 's'){
    aY += speed;
    if (aY > TWO_PI){
      aY = 0.0;
    }
  } else if (key == 'z'){
    aZ -= speed;
    if (aZ < 0.0){
      aZ = TWO_PI;
    }
  } else if (key == 'x'){
    aZ += speed;
    if (aZ > TWO_PI){
      aZ = 0.0;
    }
  } else if (key == ' '){
    aZ = 0;
    aY = 0;
    aX = 0;
  }
}
void draw() {  
  background(0.5);
    
  scale(80);
  
  rotateX(aX);
  rotateY(aY);
  rotateZ(aZ);
  
  // Cubo 
  noStroke();
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

 //Linhas
 // Eixo X = Vermelho
 // Eixo Y = Verde
 // Eixo Z = Azul
  stroke(1,0,0);
  line(-100, 0, 0, 100, 0, 0);
  stroke(0,1,0);
  line(0, -100, 0, 0, 100, 0);
  stroke(0,0,1);
  line(0, 0, -100, 0, 0, 100);


}
