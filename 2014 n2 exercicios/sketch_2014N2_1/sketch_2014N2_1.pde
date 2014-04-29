// separar as componentes rgb de uma imagem
PImage img, imgRed, imgGreen, imgBlue;
boolean colored;

void setup(){
  img = loadImage("rosa.jpg");
  imgRed = loadImage("rosa.jpg");
  imgGreen = loadImage("rosa.jpg");
  imgBlue = loadImage("rosa.jpg");
  size(2*img.width,2*img.height);
}

void draw(){
  noTint();
  image(img,0,0);
  imgRed.loadPixels();
  imgGreen.loadPixels();
  imgBlue.loadPixels();
  int i=0;
  //cálculo da componente vermelha
  while(i < img.width*img.height){
    imgRed.pixels[i] = color(red(imgRed.pixels[i]));
    i++;
  }
  //cálculo da componente verde
  i=0;
  while(i < img.width*img.height){
    imgGreen.pixels[i] = color(green(imgGreen.pixels[i]));
    i++;
  }
  //cálculo da componente azul
  i=0;
  while(i < img.width*img.height){
    imgBlue.pixels[i] = color(blue(imgBlue.pixels[i]));
    i++;
  }
  
  imgRed.updatePixels();
  imgGreen.updatePixels();
  imgBlue.updatePixels();
      
  if (colored){
    tint(255,0,0);
    image(imgRed,width/2,0);
    tint(0,255,0);
    image(imgGreen,0,height/2);
    tint(0,0,255);
    image(imgBlue,width/2,height/2);    
  }else{
    image(imgRed,width/2,0);
    image(imgGreen,0,height/2);
    image(imgBlue,width/2,height/2);
  }
    
  
  // grid separando as imagens
  strokeWeight(2);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  
}

void mouseClicked(){
  colored = !colored;
}
