PShape s;
float biggest = 0.4;
float smallest = 0.1;
int step = 0;
float fSize = 0.1;

void setup(){
  size(600,600);  
  s = loadShape("male.svg");
  frameRate(3);
  smooth();
}

void draw(){
  background(204);
  
  s.disableStyle();
  fill(20,255,30);
  noStroke();
  
  s.scale(fSize) ;
  shape(s, 300, 300);

  fSize = fSize+0.1;
  
  if (fSize > 0.4){
    fSize = 0.1;
  }
}

