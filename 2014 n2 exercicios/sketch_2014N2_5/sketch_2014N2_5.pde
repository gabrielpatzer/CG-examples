PImage imgOriginal, imgThresh;
int[] hist;
void setup(){
  imgOriginal = loadImage("lena-gray.png");
  size(imgOriginal.width,imgOriginal.height);
  imgThresh = createImage(width,height,RGB);
  imgOriginal.loadPixels();
  //calcula o histograma da imagem original
  hist = new int[256];
  for (int i = 0; i < imgOriginal.width; i++) {
    for (int j = 0; j < imgOriginal.height; j++) {
      int bright = int(brightness(imgOriginal.pixels[j*i+i]));
      hist[bright]++; 
    }
  }
  
  thresholdOtsu();
}

void draw(){
  if (mousePressed) background(imgThresh);
  else background(imgOriginal);
  
}
void thresholdOtsu(){
  imgOriginal.loadPixels();
  imgThresh.loadPixels();
    
  // determina o limiar pelo método de otsu
  int soma = 0;
  for (int i=0; i < 255; ++i) soma += i*hist[i];
  int somaFundo=0, pesoFundo=0, pesoFrente=0, mediaFundo=0, mediaFrente=0;
  float max=0, th1=0, th2=0, entre=0;
  for(int i=0; i<255; ++i){
    pesoFundo += hist[i];
    if (pesoFundo==0) continue;
    pesoFrente = width*height - pesoFundo;
    if (pesoFrente == 0) break;
    somaFundo += i*hist[i];
    mediaFundo = somaFundo / pesoFundo;
    mediaFrente = (soma - somaFundo) / pesoFrente;
    entre = (float)pesoFundo * (float)pesoFrente * (mediaFundo - mediaFrente)*(mediaFundo - mediaFrente);
    if (entre >= max){
      th1 = i;
      if (entre > max){
        th2 = i;
      }
      max = entre;
    }
  }
  int valor = floor((th1 + th2) / 2);
  System.out.print(valor);
  for (int x = 0; x < imgOriginal.width; x++) {
    for (int y = 0; y < imgOriginal.height; y++ ) {
      int loc = x + y*imgOriginal.width;
      // Test the brightness against the threshold
      if (brightness(imgOriginal.pixels[loc]) > valor) {
        imgThresh.pixels[loc]  = imgOriginal.pixels[loc];  // White
      }  else {
        imgThresh.pixels[loc]  = color(0);    // Black
      }
    }
  }

  // We changed the pixels in destination
  imgThresh.updatePixels();
}
