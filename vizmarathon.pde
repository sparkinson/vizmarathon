import processing.opengl.*;

groupset[] groups = new groupset[2];
boolean refresh = true;

float displayScale = 0.5;
float currentScale = 0.01;

void setup(){
  //hint(ENABLE_OPENGL_4X_SMOOTH);
  size(800,850); 
  background(255);
  saveFrame(); 
  
  randomSeed(millis());
  
  groups[0] = new groupset();
  groups[1] = new groupset();
  
  groups[0].addPeople(120, 2, 0, 0);
  groups[0].addPeople(96, 2, 1, 1);
  groups[0].addPeople(84, 2, 2, 2);
  
  groups[1].addPeople(24, 2, 0, 0);
  groups[1].addPeople(36, 2, 1, 1);
  groups[1].addPeople(40, 2, 2, 2);
}

void draw(){
  if (currentScale <= displayScale)
  {
    background(255);
    showgroups(currentScale);
    currentScale = currentScale + 0.01;
  }
}

void showgroups(float fScale)
{
  groups[0].setLayout(10., 10., 24, fScale);
  groups[1].setLayout(600., 10.,8, fScale);
  
  groups[0].show();
  groups[1].show();
}

