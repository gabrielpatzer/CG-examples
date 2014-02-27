PFont f;
float varFixa=0.5;
int modo=0;
float h=0, s=0, b=0;

void setup() {
  size(500, 500);
  f = createFont("Arial",20,true);
  textFont(f,14);
  textAlign(LEFT);
  colorMode(HSB, 1); 
}

void mouseClicked(){
  // modo 0 --> Matiz (Hue) fixa
  // modo 1 --> Saturação (Saturation) fixa
  // modo 2 --> Brilho (Brightness) fixo
  modo ++;
  if (modo == 3) modo = 0;
}
void draw() {  
  float var1 = (float)mouseY/height;
  float var2 = (float)mouseX/width;
  
  if (modo == 0){
    h = varFixa;
    s = var1;
    b = var2;
  }
  else if (modo == 1){
    h = var1;
    s = varFixa;
    b = var2;
  }
  else if (modo == 2){
    h = var1;
    s = var2;
    b = varFixa;
  }
  background(h,s,b);
  
  fill(1);
  rect(0,0,150,80);
  fill(0);
  text("Hue = "+h,20,20);
  text("Sat = "+s,20,40);
  text("Bri = "+b,20,60);
}
