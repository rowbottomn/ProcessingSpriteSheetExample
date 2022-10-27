PImage mirrorImage(PImage img){
  
  PImage mirrored = createImage(img.width,img.height,RGB);//create a new image with the same dimensions
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      mirrored.set(img.width-x-1,y,img.get(x,y));
    }
  }
  return mirrored;
}

void drawLeft(PImage img, float x, float y){
  //prepare for some transformations
  pushMatrix();
  translate(x, y);//move the origin to the intended location
  scale(-1, 1);//mirror the x dim
  image(img, 0, 0);//draw the image
  popMatrix();//undo the transformations
}


void drawRotated(PImage img, float x, float y, float angle, boolean reflected){
  //prepare for some transformations
  pushMatrix();
  translate(x, y);//move the origin to the intended location
  if (reflected){
     scale(-1, 1);//mirror the x dim 
  }
  rotate(angle);//mirror the x dim
  image(img, 0, 0);//draw the image
  popMatrix();//undo the transformations
}
