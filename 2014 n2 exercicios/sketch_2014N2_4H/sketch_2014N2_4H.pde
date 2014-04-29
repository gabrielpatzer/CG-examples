PImage img, iRed, iBlue, iGreen, iComb1, iComb2, iComb3;

img = loadImage("swirl.jpg");
size(img.width*3,img.height*2);
iRed = createImage(img.width,img.height,RGB);
iBlue = createImage(img.width,img.height,RGB);
iGreen = createImage(img.width,img.height,RGB);
iComb1 = createImage(img.width,img.height,RGB);
iComb2 = createImage(img.width,img.height,RGB);
iComb3 = createImage(img.width,img.height,RGB);

img.loadPixels();
iRed.loadPixels();
iBlue.loadPixels();
iGreen.loadPixels();
iComb1.loadPixels();
iComb2.loadPixels();
iComb3.loadPixels();

for (int i=0; i < img.width*img.height; ++i){
  float r = red(img.pixels[i]);
  float g = green(img.pixels[i]);
  float b = blue(img.pixels[i]);
  if (r > 127) iRed.pixels[i] = color(255);
  else iRed.pixels[i] = color(0);
  if (g > 127) iGreen.pixels[i] = color(255);
  else iGreen.pixels[i] = color(0);
  if (b > 127) iBlue.pixels[i] = color(255);
  else iBlue.pixels[i] = color(0);
  r = brightness(iRed.pixels[i]);
  g = brightness(iGreen.pixels[i]);
  b = brightness(iBlue.pixels[i]);
  if (r>0 || g>0 || b>0) iComb1.pixels[i] = color(255);
  else iComb1.pixels[i] = color(0);
  if (r>0 && g>0 && b>0) iComb2.pixels[i] = color(255);
  else iComb2.pixels[i] = color(0);
  iComb3.pixels[i] = color(r,g,b);
}

image(iRed,0,0); image(iGreen,width/3,0); image(iBlue,width*2/3,0);
image(iComb1,0,height/2); image(iComb2,width/3,height/2); image(iComb3,width*2/3,height/2);

