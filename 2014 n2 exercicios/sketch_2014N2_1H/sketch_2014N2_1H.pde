// separar as componentes rgb de uma imagem
// permite selecionar a imagem
import javax.swing.*;

PImage img, imgRed, imgGreen, imgBlue;
boolean colored;
JFileChooser fc;

void setup(){
  fc = new JFileChooser();
  File f= new File("");
  int ret = fc.showOpenDialog(this);
  if (ret == JFileChooser.APPROVE_OPTION)
    f = fc.getSelectedFile();
  else
    System.exit(1);
  img = loadImage(f.getAbsolutePath());
  imgRed = loadImage(f.getAbsolutePath());
  imgGreen = loadImage(f.getAbsolutePath());
  imgBlue = loadImage(f.getAbsolutePath());
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
