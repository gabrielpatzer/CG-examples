void setup(){
  size(800,600);
  strokeWeight(3);
}

void draw(){
  background(190);
  int x = mouseX, y = mouseY;
  fill(255);
  /**
   * Pontas externas da estrela: 90º, 210º e 330º
   * Pontas internas da estrela: 30º, 150º e 270º
   * cos 90 = 0
   * sin 90 = 1
   * cos 210 = -raiz(3)/2
   * sin 210 = -0,5
   * cos 330 = +raiz(3)/2
   * sin 330 = -0,5
   *
   * cos 30 = raiz(3)/2
   * sin 30 = 0,5
   * cos 150 = -raiz(3)/2
   * sin 150 = 0,5
   * cos 270 = 0
   * sin 270 = -1
   */
  beginShape();
  // 90
  vertex(x,y-170);
  // 30
  vertex(x+40*sqrt(3)/2,y-40/2);
  // 330
  vertex(x+170*sqrt(3)/2,y+170/2);
  // 270
  vertex(x,y+40);
  // 210
  vertex(x-170*sqrt(3)/2,y+170/2);
  // 150
  vertex(x-40*sqrt(3)/2,y-40/2);
  endShape(CLOSE);
  noFill();
  ellipse(x,y,350,350);
}
