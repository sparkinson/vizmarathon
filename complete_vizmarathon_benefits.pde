import processing.opengl.*;

PFont fontA;
PFont fontB;
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

color[] colors = new color[6];

oMap sexyMap;

int iQuestion = 1;

boolean bRedraw = true;

void setup(){
  //colorMode(RGB, 255, 255, 255, 100);
  
  size(iGW,iGH); 
  
  fontA = loadFont("FreeSans-14.vlw");
  fontB = loadFont("FreeSansBold-14.vlw");
  
  textFont(fontA, 12);
  background(255);
  randomSeed(millis());

  legend[0] = loadShape("boy.svg");
  legend[1] = loadShape("man.svg");
  legend[2] = loadShape("grandad.svg");
  legend[3] = loadShape("girl.svg");
  legend[4] = loadShape("women.svg");
  legend[5] = loadShape("granny.svg");
  
  colors[0] = color(0, 133, 199);
  colors[1] = color(244, 195, 0);
  colors[2] = color(0, 0, 0);
  colors[3] = color(0, 159, 61);
  colors[4] = color(223, 0, 36);
  colors[5] = color(200, 200, 200);
  
  groups = new groupset(6);
  sexyMap = new oMap();
  setupData();
  
  // 0 - current problems
  // 1 - economy
  // 2 - benefits of games
  // 3 - greeness
  // 4 - emotions
  
  for(int i=0;i<6;i++){
    legend[i].disableStyle();}
  for(int i=0;i<6;i++){
    legend[i].scale(0.6);}
}

void setupData()
{
  String[] labels = {};
  switch(iQuestion) {
    case 2: 
      groups.addPeople(171, 0, 1, 2, 10);
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
      
      sexyMap.alphas[0] = new int[] {112 , 116, 112, 115, 105};
      sexyMap.alphas[1] = new int[] {61 , 70, 61, 68, 63};
      sexyMap.alphas[2] = new int[] {59 , 64, 58, 65, 62};
      sexyMap.alphas[3] = new int[] {65 , 64, 69, 73, 59};
      sexyMap.alphas[4] = new int[] {89 , 104, 104, 106, 98};
      sexyMap.alphas[5] = new int[] {36 , 35, 35, 40, 45};
      sexyMap.alphas[6] = new int[] {40 , 40, 40, 40, 40};
      
      labels = new String[] {"Finance", "Resources", "Society", "Security", "Personal Issues", "Global Crises"};
      break;
    case 0: 
      groups.addPeople(171, 0, 1, 2, 10);
      groups.addPeopleToSelect(29, 2, 0, 0, 0);
      groups.addPeopleToSelect(33, 2, 1, 0, 0);
      groups.addPeopleToSelect(37, 2, 2, 0, 0);
      groups.addPeopleToSelect(16, 2, 0, 0, 1);
      groups.addPeopleToSelect(13, 2, 1, 0, 1);
      groups.addPeopleToSelect(10, 2, 2, 0, 1);
      groups.addPeopleToSelect(44, 2, 0, 0, 2);
      groups.addPeopleToSelect(46, 2, 1, 0, 2);
      groups.addPeopleToSelect(47, 2, 2, 0, 2);
      
      sexyMap.alphas[0] = new int[] {149,135,155,146,150};
      sexyMap.alphas[1] = new int[] {205,201,203,213,205};
      sexyMap.alphas[2] = new int[] {57 , 56, 53, 58, 61};
      sexyMap.alphas[3] = new int[] {200 , 100, 150, 300, 0};
      sexyMap.alphas[4] = new int[] {200 , 250, 150, 100, 0};
      sexyMap.alphas[5] = new int[] {200 , 100, 20, 20, 20};
      sexyMap.alphas[6] = new int[] {40 , 40, 40, 40, 40};

      
      labels = new String[] {"Future economy is serious issue", "Olympics will boost the economy", "Only good if it makes money"};
      break;
    case 1:
      groups.addPeople(171, 0, 1, 2, 10);
      groups.addPeopleToSelect(13, 2, 0, 0, 0);
      groups.addPeopleToSelect(16, 2, 1, 0, 0);
      groups.addPeopleToSelect(16, 2, 2, 0, 0);
      groups.addPeopleToSelect(44, 2, 0, 0, 1);
      groups.addPeopleToSelect(41, 2, 1, 0, 1);
      groups.addPeopleToSelect(41, 2, 2, 0, 1);
      
      sexyMap.alphas[0] = new int[] {66,65,73,65,77};
      sexyMap.alphas[1] = new int[] {188,190,182,190,178};
      sexyMap.alphas[2] = new int[] {57 , 56, 53, 58, 61};
      sexyMap.alphas[3] = new int[] {200 , 100, 150, 300, 0};
      sexyMap.alphas[4] = new int[] {200 , 250, 150, 100, 0};
      sexyMap.alphas[5] = new int[] {200 , 100, 20, 20, 20};
      sexyMap.alphas[6] = new int[] {40 , 40, 40, 40, 40};
      
      labels = new String[] {"No benefit identified", "Benefit identified"};
      break;
    case 3:
      groups.addPeople(171, 0, 1, 2, 10);
      groups.addPeopleToSelect(27, 2, 0, 0, 0);
      groups.addPeopleToSelect(18, 2, 1, 0, 0);
      groups.addPeopleToSelect(15, 2, 2, 0, 0);
      groups.addPeopleToSelect(3, 2, 0, 0, 1);
      groups.addPeopleToSelect(3, 2, 1, 0, 1);
      groups.addPeopleToSelect(2, 2, 2, 0, 1);
      
      sexyMap.alphas[0] = new int[] {101,82,84,84,99};
      sexyMap.alphas[1] = new int[] {19,10,11,11,16};
      sexyMap.alphas[2] = new int[] {57 , 56, 53, 58, 61};
      sexyMap.alphas[3] = new int[] {200 , 100, 150, 300, 0};
      sexyMap.alphas[4] = new int[] {200 , 250, 150, 100, 0};
      sexyMap.alphas[5] = new int[] {200 , 100, 20, 20, 20};
      sexyMap.alphas[6] = new int[] {40 , 40, 40, 40, 40};
      
      labels = new String[] {"Personal impact", "National impact"};
      break;
      
    case 4:
      groups.addPeople(171, 0, 1, 2, 10);
      groups.addPeopleToSelect(22, 2, 0, 0, 0);
      groups.addPeopleToSelect(19, 2, 1, 0, 0);
      groups.addPeopleToSelect(17, 2, 2, 0, 0);
      groups.addPeopleToSelect(7, 2, 0, 0, 1);
      groups.addPeopleToSelect(8, 2, 1, 0, 1);
      groups.addPeopleToSelect(7, 2, 2, 0, 1);
      groups.addPeopleToSelect(4, 2, 0, 0, 2);
      groups.addPeopleToSelect(2, 2, 1, 0, 2);
      groups.addPeopleToSelect(3, 2, 2, 0, 2);
      groups.addPeopleToSelect(5, 2, 0, 0, 3);
      groups.addPeopleToSelect(4, 2, 1, 0, 3);
      groups.addPeopleToSelect(4, 2, 2, 0, 3);
      groups.addPeopleToSelect(13, 2, 0, 0, 4);
      groups.addPeopleToSelect(12, 2, 1, 0, 4);
      groups.addPeopleToSelect(11, 2, 2, 0, 4);
      groups.addPeopleToSelect(20, 2, 0, 0, 5);
      groups.addPeopleToSelect(20, 2, 1, 0, 5);
      groups.addPeopleToSelect(18, 2, 2, 0, 5);
      
      sexyMap.alphas[0] = new int[] {101,98,80,72,66};
      sexyMap.alphas[1] = new int[] {30,34,31,35,24};
      sexyMap.alphas[2] = new int[] {9 , 15, 14, 14, 7};
      sexyMap.alphas[3] = new int[] {22 , 21, 18, 14, 11};
      sexyMap.alphas[4] = new int[] {64 , 51, 49, 52, 50};
      sexyMap.alphas[5] = new int[] {77 , 96, 83, 83, 67};
      sexyMap.alphas[6] = new int[] {40 , 40, 40, 40, 40};
      
      labels = new String[] {"Excitement", "Triumph", "Fear", "Anxiety", "Inspiration", "Pride"};
      break;
  }
  
  int[] keys = {0,1,2,3,4,5};
  oOptions = new options(labels, keys);
}

void draw(){
  oOptions.check();
  
  if (bRedraw)
  {
    background(255);
    smooth();
    
    noStroke();
    fill(colors[iQuestion]);
    shape(legend[0],AdjustLeft + 67,AdjustDown + 42);
    shape(legend[1],AdjustLeft + 112,AdjustDown + 30);
    shape(legend[2],AdjustLeft + 162,AdjustDown + 30);
    shape(legend[3],AdjustLeft + 67,AdjustDown + 97);
    shape(legend[4],AdjustLeft + 112,AdjustDown + 85);
    shape(legend[5],AdjustLeft + 162,AdjustDown + 85);
  
    fill(51);
    text("16-34", AdjustLeft + 60, AdjustDown + 16);
    text("35-54", AdjustLeft + 110, AdjustDown + 16);
    text("55+", AdjustLeft + 160, AdjustDown + 16);
    text("Male", AdjustLeft, AdjustDown + 60);
    text("Female", AdjustLeft, AdjustDown + 117);
  
    oOptions.show();
    groups.addSelectToPeople(iSelect);
    showgroups(displayScale);
    
    sexyMap.show();
    
    bRedraw = false;
  }
}

void showgroups(float fScale)
{
  groups.setLayout(20., 55., 19, fScale);
  
  groups.show(iSelect);
}

class button{
  int iX;
  int iY;
  int iHeight;
  int iWidth;
  String label;
  
  button(int iX_, int iY_, int iHeight_, int iWidth_, String label_)
  {   
    iX = iX_;
    iY = iY_;
    iHeight = iHeight_;
    iWidth = iWidth_;
    label = label_;
  }  
 
  boolean contains(int iX_, int iY_)
  {
    if ((iX < iX_) && (iX_ < iX + iWidth) && (iY < iY_) && (iY_ < iY + iHeight))
    {
      return true;
    } 
    return false;
  } 
  
  void show()
  {
    fill(51);
    textFont(fontB, 12);
    text(label, iX + 4, iY + 20);
    textFont(fontA, 12); 
    //stroke(200);
    //quad(iX, iY, iX + iWidth, iY, iX + iWidth, iY + iHeight, iX, iY + iHeight);
  }
}

class groupset{
  person[] people = new person[0];
  person[][] people_select = new person[0][0];
  float fX;
  float fY;
  
  groupset(int nSets){
    people_select = new person[nSets][0];
  }
  
  void addPerson(person person_)
  {
    person[] people_ = new person[people.length];
    arrayCopy(people, people_);
    //person[] people_ = people;
    people = new person[people.length + 1];
    for (int i = 0; i < people_.length; i++)
    {
      people[i] = people_[i];
    }
    people[people_.length] = person_;
  }
  
  void addPeople(int nPeople, int iGender, int iAgeGroup, int iRegionID, int iAnswerKey)
  {
    for (int i = 0; i < nPeople; i++)
    {
      person person_ = new person(iGender, iAgeGroup, iRegionID, iAnswerKey);
      this.addPerson(person_);
    }  
  }
  
  void addPersonToSelect(int iKey, person person_)
  {
    person[] people_ = new person[people_select[iKey].length];
    arrayCopy(people_select[iKey], people_);
    people_select[iKey] = new person[people_select[iKey].length + 1];
    for (int i = 0; i < people_.length; i++)
    {
      people_select[iKey][i] = people_[i];
    }
    people_select[iKey][people_.length] = person_;
  }
  
  void addPeopleToSelect(int nPeople, int iGender, int iAgeGroup, int iRegionID, int iAnswerKey)
  {
    for (int i = 0; i < nPeople; i++)
    {
      person person_ = new person(iGender, iAgeGroup, iRegionID, iAnswerKey);
      this.addPersonToSelect(iAnswerKey, person_);
    }  
  }
  
  void addSelectToPeople(int iKey)
  {
    this.people = new person[0];
    this.addPeople(171, 0, 1, 2, 10);
    
    if (iKey != -1)
    {
      for (int i = 0; i < people_select[iKey].length; i++)
      {
        people[i] = people_select[iKey][i];
      }
    }
  }
  
  void setLayout(float fX_, float fY_, int nWide, float fScale)
  {
    fX = fX_;
    fY = fY_;
    this.setScale(fScale);
    for (int i = 0; i < people.length; i++)
    {
      people[i].fX = fX_ + people[i].unscaledWidth * fScale * 
        (i - int(i/nWide) * nWide);
      people[i].fY = fY_ + people[i].unscaledHeight * fScale * 
        int(i/nWide);  
    }    
  }
  
  void setScale(float fScale)
  {
    for (int i = 0; i < people.length; i++)
    {
      people[i].removeScale();
      people[i].fScale = fScale;
      people[i].rescale();
    }    
  }
  
  void show(int iSelect) 
  {
    for (int i = 0; i < people.length; i++)
    {
      people[i].show(iSelect);
    }  
  }
}

class options{
  button[] buttons;
  int[] iKeys;
  
  options(String[] labels, int[] keys)
  {
    buttons = new button[labels.length];
    iKeys = keys;
    for (int i = 0; i < labels.length; i++)
    {
      buttons[i] = new button(50 + i*(iGW - 100)/labels.length, 10, 30, (iGW - 100)/labels.length - 25, labels[i]);
    }
  }
  
  void check()
  {
    boolean inBox = false;
    int oldiSelect = iSelect;
    for (int i = 0; i < buttons.length; i++)
    { 
      if (buttons[i].contains(mouseX, mouseY))
      {
        iSelect = iKeys[i];
        inBox = true;
      } 
    }   
    if (inBox == false) {
      iSelect = -1;
    }
    if (iSelect != oldiSelect){
      bRedraw = true;
    }
  }
  
  void show()
  {
    for (int i = 0; i < buttons.length; i++)
    { 
      buttons[i].show();
    }  
  }
}

class person{
  PShape oShape;
  int iGender;
  int iAgeGroup;
  int iRegionID;
  int iAnswerKey;
  float fScale = 1.0;
  float fX;
  float fY;
  color oColour;
  float unscaledWidth = 46;
  float unscaledHeight = 100;
  
  person(int iGender_, int iAgeGroup_, int iRegionID_, int iAnswerKey_)  {
    iGender = iGender_;
    iAgeGroup = iAgeGroup_;
    iRegionID = iRegionID_;
    iAnswerKey = iAnswerKey_;
    this.loadGraphic();
    this.setColour();
  }
  
  void setColour()
  {
    switch(iRegionID) {
      case 0: 
        oColour = colors[iQuestion];
        break;
      case 1: 
        oColour = color(252,178,80);
        break;
      case 2:
        oColour = color(200,200,200);
        break;
    }
  }
  
  void loadGraphic()
  {
    if (iGender == 2) {
      iGender = int(floor(random(0,1.999999)));
    }
    switch(iGender) {
      case 0:
        switch(iAgeGroup) {
          case 0: 
            oShape = loadShape("boy.svg");
            break;
          case 1: 
            oShape = loadShape("man.svg");
            break;
          case 2:
            oShape = loadShape("grandad.svg");
            break;
        }
        break;
      case 1:
        switch(iAgeGroup) {
          case 0: 
            oShape = loadShape("girl.svg");
            break;
          case 1: 
            oShape = loadShape("women.svg");
            break;
          case 2:
            oShape = loadShape("granny.svg");
            break;
        }
        break;
    }  
  }
  
  void show(int iSelect)
  {
    smooth();
    oShape.disableStyle();
    fill(oColour);
    noStroke();
    shape(oShape, fX, fY);  
  }
  
  void removeScale()
  {
    oShape.scale(1./fScale);
  }
  
  void rescale()
  {
    oShape.scale(fScale);  
  }
}

class oMap{
  PShape[] regions = new PShape[5]; 
  int[][] alphas = new int[7][5];
  
  oMap()
  {
    regions[4] = loadShape("London.svg");  
    regions[3] = loadShape("South.svg");  
    regions[2] = loadShape("Midlands and Wales.svg");  
    regions[1] = loadShape("North.svg");  
    regions[0] = loadShape("Scotland.svg");  
    
    for (int i = 0; i < 5; i++)
    {
      regions[i].scale(0.5);
    }
  }
  
  void show()
  {
    smooth();
    for (int i = 0; i < 5; i++)
    {
      regions[i].disableStyle();
    }
    noStroke();
    int selector = iSelect;
    if (selector == -1)
    {
      selector = 6;
    }
    //fill(red(colors[0]), green(colors[0]), blue(colors[0]), alphas[selector][0]);
    fill(255 - alphas[selector][0]);
    shape(regions[0], 612, 280);
    //fill(colors[1], alphas[selector][1]);
    fill(255 - alphas[selector][1]);
    shape(regions[1], 662, 360);
    //fill(colors[2], alphas[selector][2]);
    fill(255 - alphas[selector][2]);
    shape(regions[2], 633, 415);
    //fill(colors[3], alphas[selector][3]);
    fill(255 - alphas[selector][3]);
    shape(regions[3], 629, 431);
    //fill(colors[4], alphas[selector][4]);
    fill(255 - alphas[selector][4]);
    shape(regions[4], 707, 461);
    
    fill(51);
    text("Select answers at the top to display \nsurvey results.", AdjustLeft, 230);
    text("On the map, darkness increases \nwith the number of choices \nmade", AdjustLeft, 535);
  }
}
