float [] x;
int count=6;
float returned=0;
int size=100;

void setup() {
  size(800,600);
  background(255);
  x= new float[count];
  for(int i=0;i<count;i++){
    x[i]=int(random(1,7));
    print(x[i]);
  }
}

void draw() {
  background(255);
  dice(count);
}

void dice(int n){
  for(int i=0;i<n;i++){
    strokeWeight(size/50);
    if(x[i]==0) {
      fill(0);
    }
    square(size*i,height-size,size);
    fill(255);
    strokeWeight(size/5);
    if(x[i]==1) {
      point(size*i+size/2,height-size/2);
    }
    if(x[i]==2) {
      point(size*i+size/4,height-size/4);
      point(size*i+size*3/4,height-size*3/4);
    }
    if(x[i]==3) {
      point(size*i+size/2,height-size/2);
      point(size*i+size/4,height-size/4);
      point(size*i+size*3/4,height-size*3/4);
    }
    if(x[i]==4) {
      point(size*i+size/4,height-size/4);
      point(size*i+size/4,height-size*3/4);
      point(size*i+size*3/4,height-size*3/4);
      point(size*i+size*3/4,height-size/4);
    }
    if(x[i]==5) {
      point(size*i+size/2,height-size/2);
      point(size*i+size/4,height-size/4);
      point(size*i+size/4,height-size*3/4);
      point(size*i+size*3/4,height-size*3/4);
      point(size*i+size*3/4,height-size/4);
    }
    if(x[i]==6) {
      point(size*i+size*2/7,height-size/6);
      point(size*i+size*5/7,height-size/6);
      point(size*i+size*2/7,height-size/2);
      point(size*i+size*5/7,height-size/2);
      point(size*i+size*2/7,height-size*5/6);
      point(size*i+size*5/7,height-size*5/6);
    }
  }
}

void mousePressed(){
  for(int i=0;i<count;i++){
    if(size*i<mouseX&&height-size<mouseY) {
      if(mouseX<size*(i+1)&&mouseY<height){
        returned=x[i];
        x[i]=0;
      }
    }
  }
}
