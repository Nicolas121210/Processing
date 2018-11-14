import org.openkinect.processing.*;

Kinect2 kinect2;

void setup() {
  size(512,424, P3D);
  kinect2 = new Kinect2(this);
  
  kinect2.initDepth();
  kinect2.initDevice();
}

void draw() {
  background(0);
  
  PImage img = kinect2.getDepthImage();
  
  //image(img,0,0);
  int skip = 10;
  for (int x = 0; x < img.width; x+=skip) {
    for (int y = 0; y < img.height; y+=skip) {
      int index = x + y * img.width;
      float b = brightness(img.pixels[index]);
      float z = map(b, 0, 255, 250, -250);
      if (255-b > 00) {
        pushMatrix();
        translate(x,y,z);
        fill(x,255-b,y);
        rect(0,0,skip/2,skip/2);
        popMatrix();
      }
    }
  }
  
}
