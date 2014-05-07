float angM, angH, spd;

void setup(){
  size(600,400);
  spd = 0.01; //aprox 10 segundos para 1 volta do ponteiro dos minutos
  angH = angM = 0;
}

void draw(){
  background(100);
  // o que for desenhado por último aparece por cima, portanto começamos com o círculo base do relógio
  stroke(150);
  strokeWeight(10);
  fill(255);
  ellipse(width/2,height/2,200,200);
  
  // marcações das horas
  stroke(0);
  strokeWeight(1);
  line(width/2,height/2-90,width/2,height/2-80);
  line(width/2-90,height/2,width/2-80,height/2);
  line(width/2,height/2+80,width/2,height/2+90);
  line(width/2+90,height/2,width/2+80,height/2);
  
  // ponteiro dos minutos
  pushMatrix();
  stroke(0);
  strokeWeight(4);
  translate(width/2,height/2);
  rotate(angM);
  translate(-width/2,-height/2);
  line(width/2,height/2+15,width/2,height/2-90);
  angM += spd;
  popMatrix();
  
  // ponteiro das horas
  pushMatrix();
  translate(width/2,height/2);
  rotate(angH);
  translate(-width/2,-height/2);
  stroke(255,0,0);
  strokeWeight(4);
  line(width/2,height/2+15,width/2,height/2-60);
  angH += spd/(12);
  popMatrix();
  
  // por último o pino
  noStroke();
  fill(170);
  ellipse(width/2,height/2,10,10);
}
