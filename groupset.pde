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
