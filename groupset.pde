class groupset{
  person[] people = new person[0];
  float fX;
  float fY;
  
  groupset(){
    
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
  
  void addPeople(int nPeople, int iGender, int iAgeGroup, int iRegionID)
  {
    for (int i = 0; i < nPeople; i++)
    {
      person person_ = new person(iGender, iAgeGroup, iRegionID);
      this.addPerson(person_);
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
  
  void show() 
  {
    for (int i = 0; i < people.length; i++)
    {
      people[i].show();
    }  
  }
}
