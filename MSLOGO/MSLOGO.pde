PImage imagem;

void setup(){
  imagem = loadImage("logo-ms.jpg");
  size(imagem.width,imagem.height);//600,564
}

void draw(){
  background(imagem);

// grid
strokeWeight(1);
for(int i=0;i<imagem.width;i=i+10){
  if ((i%50) == 0)
    stroke(0,80);
  else
    stroke(120,80);
  line(i,0,i,imagem.height);
  }
for(int i=0;i<imagem.height;i=i+10){
  if ((i%50) == 0)
    stroke(0,80);
  else
    stroke(120,80);
  line(0,i,imagem.width,i);
  }
  
  if (mousePressed){
    stroke(0);
    strokeWeight(3);
    //RED BANNER
    fill(255,0,0);
    beginShape();
      vertex(132,55);
      quadraticVertex(270,5,343,70);
      vertex(285,260);
      quadraticVertex(220,200,80,250);
    endShape(CLOSE);
    //GREEN BANNER
    fill(0,255,0);
    beginShape();
      vertex(365,85);
      quadraticVertex(450,150,580,100);
      vertex(530,290);
      quadraticVertex(400,345,310,280);
    endShape(CLOSE);
    //BLUE BANNER
    fill(0,0,255);
    beginShape();
      vertex(70,280);
      quadraticVertex(200,220,280,290);
      vertex(230,480);
      quadraticVertex(140,420,20,470);
    endShape(CLOSE);
    //YELLOW BANNER
    fill(255,255,0);
    beginShape();
      vertex(302,300);
      quadraticVertex(400,365,523,312);
      vertex(470,505);
      quadraticVertex(350,560,247,490);
    endShape(CLOSE);
  }
}
  
  
  
