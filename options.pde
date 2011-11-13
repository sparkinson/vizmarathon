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
    redraw();
  }
  
  void show()
  {
    for (int i = 0; i < buttons.length; i++)
    { 
      buttons[i].show();
    }  
  }
}
