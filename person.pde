class person{
  PShape oShape;
  boolean bMale;
  int iAgeGroup;
  int iRegionID;
  float fScale;
  float fX;
  float fY;
  color oColour;
  
  person(boolean bMale_, int iAgeGroup_, int iRegionID_, float fScale_,
         float fX_, float fY_)  {
    oShape = oShape_;
    bMale = bMale_;
    iAgeGroup = iAgeGroup_;
    iRegionID = iRegionID_;
    fScale = fScale_;
    fX = fX_;
    fY = fY_;  
    oColour = oColour_  
    oShape.scale(fScale);
  }
  
  void loadGraphic()
  {
    if (bMale)
    {
      
    }  
  }
  
  void show()
  {
    oShape.disableStyle();
    fill(oColour);
    noStroke();
    shape(oShape, fX, fY);  
  }
}
