/**
 * Programa de exemplo para a disciplina de Computação Gráfica
 * da Faculdade de Mauá FAMA-UNIESP.
 *  Prof. Gabriel Patzer
 *  08/03 - aprox 2h
 *
 * Este programa demonstra o uso das curvas bezier "quadráticas"
 * e cúbicas.
 * Inicialmente, é possível selecionar o tipo de curva e 
 * desenhar os elementos como no MS Paint, arrastando o segmento
 * de reta e adicionando os pontos de controle.
 */
 
 public class Point {
   int x, y;
   Point(int _x, int _y){
     x = _x; y = _y;
   }
 }
 
 // Variáveis globais
 int estado = 1;
 PFont f;
 Point pontoUm,pontoDois,pontoContUm,pontoContDois;
   
 void setup(){
   size(800,600);
   clearCanvas();
 }
 
 
 /**
  * Controla o redesenho da tela de acordo com  3 estados. Cada 
  * ação de mudança de estado e de desenho é delegada para as 
  * subrotinas adequadas.
  * estados:
  *  1 - esperando usuário clicar nos botões
  *  1x - bezier quadrático
  *  2x - bezier cúbico
  *  x1 e x2 - desenho do segmento de reta
  *  x3 ou mais - desenho do(s) ponto(s) de controle
  */
 void draw(){
   drawBotoes();
   drawGuia();
   
   // tela básica
   stroke(0);
   fill(255);
   rect(0,0,599,519);
   for (int i=0;i<600;i=i+10){
     if ( (i % 50) == 0){
       line(i,0,i,10);
     }else{
       line(i,0,i,5);
     }
   }
   for (int i=0;i<520;i=i+10){
     if ( (i % 50) == 0){
       line(0,i,10,i);
     }else{
       line(0,i,5,i);
     }
   }
   // desenhos
   strokeWeight(1);
   stroke(0);
   if (estado == 12 || estado == 22){
     line(pontoUm.x,pontoUm.y,mouseX,mouseY);
   }else if (estado == 13 || estado == 23){
     if (mousePressed){
       drawTarget(mouseX,mouseY);
       stroke(180);
       line(pontoUm.x,pontoUm.y,pontoDois.x,pontoDois.y);
       stroke(0);
       bezier(pontoUm.x,pontoUm.y,mouseX,mouseY,mouseX,mouseY,pontoDois.x,pontoDois.y);
     } else {
       stroke(0);
       line(pontoUm.x,pontoUm.y,pontoDois.x,pontoDois.y);
     }
     
   }else if (estado == 24){
     if (mousePressed){
       drawTarget(mouseX,mouseY);
       drawTarget(pontoContUm.x,pontoContUm.y);
       stroke(180);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,pontoContUm.x,pontoContUm.y,pontoDois.x,pontoDois.y);
       line(pontoUm.x,pontoUm.y,pontoDois.x,pontoDois.y);
       stroke(0);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,mouseX,mouseY,pontoDois.x,pontoDois.y);
     } else {
       drawTarget(pontoContUm.x,pontoContUm.y);
       stroke(180);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,pontoContUm.x,pontoContUm.y,pontoDois.x,pontoDois.y);
       line(pontoUm.x,pontoUm.y,pontoDois.x,pontoDois.y);
       stroke(0);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,pontoContUm.x,pontoContUm.y,pontoDois.x,pontoDois.y);
     }
   } else if (estado == 25 || estado == 14) {
       drawTarget(pontoContDois.x,pontoContDois.y);
       drawTarget(pontoContUm.x,pontoContUm.y);
       stroke(180);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,pontoContUm.x,pontoContUm.y,pontoDois.x,pontoDois.y);
       line(pontoUm.x,pontoUm.y,pontoDois.x,pontoDois.y);
       stroke(0);
       bezier(pontoUm.x,pontoUm.y,pontoContUm.x,pontoContUm.y,pontoContDois.x,pontoContDois.y,pontoDois.x,pontoDois.y);
   }
 }
 
 /**
  * Controla as mudanças de estado do programa. Identifica a 
  * posição onde o botão foi apertado e, de acordo com o estado 
  * atual, executa as ações e modifica o contexto.
  */
 void mousePressed(){
   if (estado == 11 || estado == 21){
       if (mouseX >= 0 && mouseX <= 600 &&
           mouseY >= 0 && mouseY <= 520){
             pontoUm = new Point(mouseX,mouseY);
             estado ++;
           }
   } 
 }
 
 /**
  * Controla as mudanças de estado do programa. Identifica a 
  * posição onde o botão foi apertado e, de acordo com o estado 
  * atual, executa as ações e modifica o contexto.
  */
 void mouseReleased(){ 
   if (mouseX >= 640 && mouseX <= 760 && 
       mouseY >= 220 && mouseY <= 280){
         clearCanvas();
       }
   else
   if (estado == 1){
     if (mouseX >= 640 && mouseX <= 760){
       if (mouseY >= 20 && mouseY <= 80){
         estado = 11;
       } else if (mouseY >= 120 && mouseY <= 180){
         estado = 21;
       }
     }
   }
     else
   if (estado == 12 || estado == 22){
     if (mouseX >= 0 && mouseX <= 600 &&
           mouseY >= 0 && mouseY <= 520){
             pontoDois = new Point(mouseX,mouseY);
             estado ++;
           }
   } else if(estado == 13 || estado == 23){
     if (mouseX >= 0 && mouseX <= 600 &&
           mouseY >= 0 && mouseY <= 520){
             pontoContUm = new Point(mouseX,mouseY);
             if (estado == 13) pontoContDois = pontoContUm;
             estado ++;
           }
   } else if(estado == 24){
     if (mouseX >= 0 && mouseX <= 600 &&
           mouseY >= 0 && mouseY <= 520){
             pontoContDois = new Point(mouseX,mouseY);
             estado ++;
           }
   }
 }
 
 /** Desenho do símbolo dos pontos de controle */
 void drawTarget (int x, int y){
   stroke(255,0,0);
   noFill();
   line(x-5,y,x+5,y);
   line(x,y-5,x,y+5);
   ellipse(x,y,6,6);
 }
 
 /** Controla as mensagens de texto na parte inferior da GUI. */
 void drawGuia(){
   textFont(f,26);
   noStroke();
   fill(200);
   rect(0,520,600,80);
   fill(0);
   if (estado == 1){
     text("Selecione um dos tipos de curva no menu.",0,520,600,80);
   } else if ((estado >= 11 && estado <= 12) || (estado >= 21 && estado <= 22)){
     text("Clique na área de desenho e arraste para desenhar a base da curva.",0,520,600,80);
   } else {
     text("Clique na área de desenho para definir o(s) ponto(s) de controle.",0,520,600,80);
   }
 }
 
 /**
  * Desenha os botões na tela, identificando se um  
  * deles foi apertado para destacar com um fundo diferente.
  */
 void drawBotoes(){
   noStroke();
   fill(200);
   rect(600,0,200,600);
   stroke(0);
   strokeWeight(1.5);
   fill(150);
   rect(640,20,120,60);
   rect(640,120,120,60);
   rect(640,220,120,60);
   // redesenha os botões quando pressionados
   if (mousePressed){
     if (mouseX >= 640 && mouseX <= 760){
       if (mouseY >= 20 && mouseY <= 80){
         fill(100);
         rect(640,20,120,60);
       }else if (mouseY >= 120 && mouseY <= 180){
         fill(100);
         rect(640,120,120,60);
       }else if (mouseY >= 220 && mouseY <= 280){
         fill(100);
         rect(640,220,120,60);
       }
     }
   }
   fill(0);
   f = createFont("Arial",20,true);
   textFont(f,20);
   textAlign(CENTER);
   text("Bezier Quadrático", 640,20,120,60);
   text("Bezier Cúbico", 640,120,120,60);
   text("Limpar / Cancelar", 640,220,120,60);
   // Posição dos pontos
   textFont(f,16);
   String P1 = "Ponto 1 = ( "+pontoUm.x+" , "+pontoUm.y+" )";
   String P2 = "Ponto 2 = ( "+pontoDois.x+" , "+pontoDois.y+" )";
   String PC1 = "P. de Controle 1 = ( "+pontoContUm.x+" , "+pontoContUm.y+" )";
   String PC2 = "P. de Controle 2 = ( "+pontoContDois.x+" , "+pontoContDois.y+" )";
   text(P1,640,320,120,60);
   text(P2,640,380,120,60);
   text(PC1,640,440,120,60);
   text(PC2,640,520,120,60);
   
 }
 
 /** Limpa a tela de desenho. */
 void clearCanvas(){
   estado = 1;
   pontoUm = new Point(0,0);
   pontoDois = new Point(0,0);
   pontoContUm = new Point(0,0);
   pontoContDois = new Point(0,0);
   stroke(0);
   fill(255);
   rect(0,0,599,519);
   for (int i=0;i<600;i=i+10){
     if ( (i % 50) == 0){
       line(i,0,i,10);
     }else{
       line(i,0,i,5);
     }
   }
   for (int i=0;i<520;i=i+10){
     if ( (i % 50) == 0){
       line(0,i,10,i);
     }else{
       line(0,i,5,i);
     }
   }
 }
