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
