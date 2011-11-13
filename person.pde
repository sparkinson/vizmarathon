class person{
  PShape oShape;
  int iGender;
  int iAgeGroup;
  int iRegionID;
  float fScale = 1.0;
  float fX;
  float fY;
  color oColour;
  float unscaledWidth = 525;
  float unscaledHeight = 1100;
  
  person(int iGender_, int iAgeGroup_, int iRegionID_)  {
    iGender = iGender_;
    iAgeGroup = iAgeGroup_;
    iRegionID = iRegionID_;
    this.loadGraphic();
    this.setColour();
  }
  
  void setColour()
  {
    switch(iRegionID) {
      case 0: 
        oColour = color(255,100,100);
        break;
      case 1: 
        oColour = color(100,255,100);
        break;
      case 2:
        oColour = color(100,100,255);
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
            oShape = loadShape("male.svg");
            break;
          case 1: 
            oShape = loadShape("male.svg");
            break;
          case 2:
            oShape = loadShape("male.svg");
            break;
        }
        break;
      case 1:
        switch(iAgeGroup) {
          case 0: 
            oShape = loadShape("female.svg");
            break;
          case 1: 
            oShape = loadShape("female.svg");
            break;
          case 2:
            oShape = loadShape("female.svg");
            break;
        }
        break;
    }  
  }
  
  void show()
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
