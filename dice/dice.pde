float [] x;
int count=6;

void setup() {
  size(800,600);
  background(255);
  dice(count,50);
  for(int i=0;i<count;i++){
  print(x[i]);
  }
}

void dice(int n,float size){
  x= new float[n];
  for(int i=0;i<n;i++){
    x[i]=int(random(1,7));
    strokeWeight(size/50);
    square(0+size*i,height-size,size);
    strokeWeight(size/10);
    if(x[i]==1) {
      point(0+size*i+size/2,height-size/2);
    }
    if(x[i]==2) {
      point(0+size*i+size/4,height-size/4);
      point(0+size*i+size*3/4,height-size*3/4);
    }
    if(x[i]==3) {
      point(0+size*i+size/2,height-size/2);
      point(0+size*i+size/4,height-size/4);
      point(0+size*i+size*3/4,height-size*3/4);
    }
    if(x[i]==4) {
      point(0+size*i+size/4,height-size/4);
      point(0+size*i+size/4,height-size*3/4);
      point(0+size*i+size*3/4,height-size*3/4);
      point(0+size*i+size*3/4,height-size/4);
    }
    if(x[i]==5) {
      point(0+size*i+size/2,height-size/2);
      point(0+size*i+size/4,height-size/4);
      point(0+size*i+size/4,height-size*3/4);
      point(0+size*i+size*3/4,height-size*3/4);
      point(0+size*i+size*3/4,height-size/4);
    }
    if(x[i]==6) {
      point(0+size*i+size*2/7,height-size/6);
      point(0+size*i+size*5/7,height-size/6);
      point(0+size*i+size*2/7,height-size/2);
      point(0+size*i+size*5/7,height-size/2);
      point(0+size*i+size*2/7,height-size*5/6);
      point(0+size*i+size*5/7,height-size*5/6);
    }
  }
}
