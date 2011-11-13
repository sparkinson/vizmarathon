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

boolean bRedraw = true;

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
  setupData(0);

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

void setupData(int iProblem)
{
  String[] labels = {};
  switch(iProblem) {
    case 0:
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

      labels = new String[] {"Finance", "Resources", "Society", "Security", "Personal Issues", "Global Crises"};
      break;
    case 1:
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

      labels = new String[] {"Future economy is serious issue", "Olympics will boost the economy", "Only good if it makes money"};
      break;
    case 2:
      groups.addPeople(171, 0, 1, 2, 10);
      groups.addPeopleToSelect(13, 2, 0, 0, 0);
      groups.addPeopleToSelect(16, 2, 1, 0, 0);
      groups.addPeopleToSelect(16, 2, 2, 0, 0);
      groups.addPeopleToSelect(44, 2, 0, 0, 1);
      groups.addPeopleToSelect(41, 2, 1, 0, 1);
      groups.addPeopleToSelect(41, 2, 2, 0, 1);

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
    text(label, iX + 4, iY + 20);
    fill(255, 255, 255, 0);
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
        oColour = color(101,152,203);
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
