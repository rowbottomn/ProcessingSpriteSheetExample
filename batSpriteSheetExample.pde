/*
Rowbottom Oct 27
  Program demonstrates how to pull from a sprite sheet and also how to draw reflected and rotated images

*/

PImage sheet;//used to store the spritesheet
PImage[] frames = new PImage[5];//stores the frames

int frameSkip = 6;//how many frames before we advance the animation
int current = 0;//this holds the current frame we are on and is the index of the frames array that we will draw

int xSpan = 5;//used for positioning where we draw from the spritesheet
int ySpan = 685;//how far down to start on the sheet
int w = 265;//width of the frames
int h = 160;//height of the frames

PVector pos = new PVector();//pos
PVector vel = new PVector(5, 0);
PVector fallSpeed = new PVector(0, 0.3);//falling when dead
boolean dead = false;

void setup() {
  size(800, 800);
  imageMode(CENTER);
  //load the spritesheet
  sheet = loadImage("sheetbw.png");

  //load each image using at least 1 for loop; use two forloops
  for (int i = 0; i < frames.length; i++) {
    frames[i] = sheet.get(xSpan*i+w*i, ySpan, w, h);
    frames[i].resize(100, 60);
  }

  pos.y = height/2;
}

void mousePressed() {
  if (dist(mouseX, mouseY, pos.x, pos.y)< 50) {
    dead = true;
  }
}

void draw() {
  background(50);
  if (!dead) {
    pos.add(vel);

    //if the number of frames have gone by,
    if (frameCount % frameSkip == 0) {
      //advance the frame of animation
      current ++;
      if (current >= 4) {
        current =0;
      }
    }

    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
  } else {
    pos.add(fallSpeed);
    current = 4;
    
  }

  //draw the correct frame
  tint(220, 170, 240); //tinting the PImage
  if (vel.x < 0) {
    drawLeft(frames[current], pos.x, pos.y);//draw it facing left
  } 
  else {  
    //image(frames[current], pos.x, pos.y);//draw it facing right
    drawRotated(frames[current], pos.x, pos.y, 20, false);
  } 

}
