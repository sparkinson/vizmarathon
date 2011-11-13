import processing.opengl.*;

PFont fontA;
boolean refresh = true;

float displayScale = 0.60;
float currentScale = 0.01;

int iGW = 800;
int iGH = 600;

PImage oKey;
options oOptions;
int iSelect = -1;
  
int AdjustLeft = 570;
int AdjustDown = 60;

PShape[] legend = new PShape[6];
groupset groups;
void setup(){
  size(iGW,iGH); 
  
  fontA = loadFont("FreeSans-14.vlw");
  textFont(fontA, 12);
  background(255);
  randomSeed(millis());

  legend[0] = loadShape("boy.svg");
  legend[1] = loadShape("man.svg");
  legend[2] = loadShape("grandad.svg");
  legend[3] = loadShape("girl.svg");
  legend[4] = loadShape("women.svg");
  legend[5] = loadShape("granny.svg");
  
  groups = new groupset(6);
  
  groups.addPeople(191, 0, 1, 2, 10);
  groups.addPeopleToSelect(26, 2, 0, 0, 0);
  groups.addPeopleToSelect(28, 2, 1, 0, 0);
  groups.addPeopleToSelect(23, 2, 2, 0, 0);
  groups.addPeopleToSelect(12, 2, 0, 0, 1);
  groups.addPeopleToSelect(14, 2, 1, 0, 1);
  groups.addPeopleToSelect(17, 2, 2, 0, 1);
  groups.addPeopleToSelect(11, 2, 0, 0, 2);
  groups.addPeopleToSelect(13, 2, 1, 0, 2);
  groups.addPeopleToSelect(17, 2, 2, 0, 2);
  groups.addPeopleToSelect(13, 2, 0, 0, 3);
  groups.addPeopleToSelect(14, 2, 1, 0, 3);
  groups.addPeopleToSelect(18, 2, 2, 0, 3);
  groups.addPeopleToSelect(17, 2, 0, 0, 4);
  groups.addPeopleToSelect(23, 2, 1, 0, 4);
  groups.addPeopleToSelect(28, 2, 2, 0, 4);
  groups.addPeopleToSelect(8, 2, 0, 0, 5);
  groups.addPeopleToSelect(8, 2, 1, 0, 5);
  groups.addPeopleToSelect(9, 2, 2, 0, 5);
  
  String[] labels = {"Finance", "Resorces", "Society", "Security", "Personal Issues", "Global Crises"};
  int[] keys = {0,1,2,3,4,5};
  oOptions = new options(labels, keys);
  
  for(int i=0;i<6;i++){
    legend[i].disableStyle();}
  for(int i=0;i<6;i++){
    legend[i].scale(0.6);}
  
  noLoop();
}

void draw(){
  background(255);
  smooth();
  
  noStroke();
  fill(color(101,152,203));
  shape(legend[0],AdjustLeft + 75,AdjustDown + 52);
  shape(legend[1],AdjustLeft + 120,AdjustDown + 40);
  shape(legend[2],AdjustLeft + 170,AdjustDown + 40);
  shape(legend[3],AdjustLeft + 75,AdjustDown + 107);
  shape(legend[4],AdjustLeft + 120,AdjustDown + 95);
  shape(legend[5],AdjustLeft + 170,AdjustDown + 95);

  fill(51);
  text("16-34", AdjustLeft + 70, AdjustDown + 30);
  text("35-54", AdjustLeft + 120, AdjustDown + 30);
  text("55+", AdjustLeft + 170, AdjustDown + 30);
  text("Male", AdjustLeft + 20, AdjustDown + 70);
  text("Female", AdjustLeft + 5, AdjustDown + 130);

  oOptions.show();
  groups.addSelectToPeople(iSelect);
  showgroups(displayScale);
}

void showgroups(float fScale)
{
  groups.setLayout(20., 55., 19, fScale);
  
  groups.show(iSelect);
}

void mouseMoved() {
  oOptions.check();
}

