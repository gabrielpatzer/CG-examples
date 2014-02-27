void setup(){
  size(800,600);
  noStroke();
}

void draw(){
  // 1ª linha, cores saturadas
  fill(200,200,200);
  rect(0,0,width/7,height*2/3);
  fill(255,255,0);
  rect(width/7,0,2*width/7,height*2/3);
  fill(0,255,255);
  rect(2*width/7,0,3*width/7,height*2/3);
  fill(0,255,0);
  rect(3*width/7,0,4*width/7,height*2/3);
  fill(255,0,255);
  rect(4*width/7,0,5*width/7,height*2/3);
  fill(255,0,0);
  rect(5*width/7,0,6*width/7,height*2/3);
  fill(0,0,255);
  rect(6*width/7,0,width,height*2/3);
  // 2ª linha de cores
  fill(0,0,255);
  rect(0,height*2/3,width/7,height*3/4);
  fill(0,0,0);
  rect(width/7,height*2/3,2*width/7,height*3/4);
  fill(255,0,255);
  rect(2*width/7,height*2/3,3*width/7,height*3/4);
  fill(20,20,20);
  rect(3*width/7,height*2/3,4*width/7,height*3/4);
  fill(0,255,255);
  rect(4*width/7,height*2/3,5*width/7,height*3/4);
  fill(20,20,20);
  rect(5*width/7,height*2/3,6*width/7,height*3/4);
  fill(200,200,200);
  rect(6*width/7,height*2/3,width,height*3/4);
  //3ª linha
  fill(0,65,128);
  rect(0,height*3/4,width*5/28,height);
  fill(255,255,255);
  rect(width*5/28,height*3/4,width*10/28,height);
  fill(55,15,140);
  rect(width*10/28,height*3/4,width*15/28,height);
  fill(20,20,20);
  rect(width*15/28,height*3/4,width*20/28,height);
  fill(0,0,0);
  rect(5*width/7,height*3/4,6*width/7-2*width/21,height);
  fill(20,20,20);
  rect(5*width/7+width/21,height*3/4,6*width/7-width/21,height);
  fill(50,50,50);
  rect(5*width/7+2*width/21,height*3/4,6*width/7,height);
  fill(20,20,20);
  rect(6*width/7,height*3/4,width,height);
} 
