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
