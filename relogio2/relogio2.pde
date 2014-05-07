import java.util.Date;

float angS, angM, angH;

void setup(){
  size(600,400);
}

void draw(){
  Date d = new Date();
  angH = map(d.getHours(),0,23,0,4*PI-2*PI/12) +
         map(d.getMinutes(),0,59,0,2*PI/12-2*PI/360);
  angM = map(d.getMinutes(),0,59,0,2*PI-2*PI/60) +
         map(d.getSeconds(),0,59,0,2*PI/60-2*PI/3600);
  angS = map(d.getSeconds(),0,59,0,2*PI-2*PI/60);
  
  background(100);
  // o que for desenhado por último aparece por cima, portanto começamos com o círculo base do relógio
  stroke(150);
  strokeWeight(10);
  fill(255);
  ellipse(width/2,height/2,200,200);
  
  // linhas de marcação das horas
  stroke(0);
  strokeWeight(1);
  line(width/2,height/2-90,width/2,height/2-80);
  line(width/2-90,height/2,width/2-80,height/2);
  line(width/2,height/2+80,width/2,height/2+90);
  line(width/2+90,height/2,width/2+80,height/2);
  
  // ponteiro dos segundos
  pushMatrix();
  stroke(0);
  strokeWeight(2);
  translate(width/2,height/2);
  rotate(angS);
  translate(-width/2,-height/2);
  line(width/2,height/2+15,width/2,height/2-90);
  popMatrix();
  
  // ponteiro dos minutos
  pushMatrix();
  stroke(0);
  strokeWeight(4);
  translate(width/2,height/2);
  rotate(angM);
  translate(-width/2,-height/2);
  line(width/2,height/2+15,width/2,height/2-90);
  popMatrix();
  
  // ponteiro das horas
  pushMatrix();
  translate(width/2,height/2);
  rotate(angH);
  translate(-width/2,-height/2);
  stroke(255,0,0);
  strokeWeight(4);
  line(width/2,height/2+15,width/2,height/2-60);
  popMatrix();
  
  // por último o pino
  noStroke();
  fill(170);
  ellipse(width/2,height/2,10,10);
}
