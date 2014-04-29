import javax.swing.JFileChooser;

PImage imgOriginal, imgThresh;
JFileChooser fc;
int thValue;
boolean original;

void setup(){
  fc = new JFileChooser();
  File f= new File("");
  int ret = fc.showOpenDialog(this);
  if (ret == JFileChooser.APPROVE_OPTION)
    f = fc.getSelectedFile();
  else
    System.exit(1);
  
  imgOriginal = loadImage(f.getAbsolutePath());
  size(imgOriginal.width,imgOriginal.height);
  imgThresh = createImage(width,height,RGB);
  
  thValue = 127;
  threshold(thValue);  
}

void draw(){
  if (original)  background(imgOriginal);
  else {
    threshold(thValue);
    background(imgThresh);
  }
}

void threshold(int valor){
  imgOriginal.loadPixels();
  imgThresh.loadPixels();
  
  for (int x = 0; x < imgOriginal.width; x++) {
    for (int y = 0; y < imgOriginal.height; y++ ) {
      int loc = x + y*imgOriginal.width;
      // Test the brightness against the threshold
      if (brightness(imgOriginal.pixels[loc]) > valor) {
        imgThresh.pixels[loc]  = color(255);  // White
      }  else {
        imgThresh.pixels[loc]  = color(0);    // Black
      }
    }
  }

  // We changed the pixels in destination
  imgThresh.updatePixels();
}

void mouseClicked(){
  original = !original;
}

void mouseWheel(MouseEvent e){
  float direcao = e.getCount();
  if (direcao > 0 && thValue < 255)
    thValue++;
  else if (direcao < 0 && thValue > 0)
    thValue --;
}
