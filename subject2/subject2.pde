float x0,y0,x1,y1,x2,y2;
float vx,vy,vs;
int sizefac, colorvar, colorfac;

void setup(){
  size(800,600);
  initialize_random_pos();
  vx=7; vy=7; vs=1;
  sizefac = 50;
  colorfac = 0;
}

void draw() {
  background(240);
  
  x0 += vx; y0 += vy;
  vx = restrictX(x0, vx);
  vy = restrictY(y0, vy);
  face0(x0,y0);
  
  sizefac += vs;
  if (sizefac > 100 || sizefac < 50) {
    vs = -vs;
  }
  face1(x1,y1,sizefac);
  
  colorvar+=1;
  colorfac = (colorvar / 60) % 3;
  star(x2,y2,colorfac);  
}

void mouseClicked() {
  initialize_random_pos();
}

void initialize_random_pos() {
  x0=400+random(-300,200);
  x1=400+random(-300,200);
  x2=400+random(-300,200);
  y0=300+random(-300,200);
  y1=300+random(-300,200);
  y2=300+random(-300,200);
}

float restrictX(float x, float vx) {
  if(x>width || x<=0) {
    vx= -vx;
  }
  return vx;
}

float restrictY(float y, float vy) {
  if(y>height||y<=0) {
    vy= -vy;
  }
  return vy;
}


//박현우
void face0(float x,float y) {
  fill(100, 220, 100);
  ellipse(x,y,80,100);
  //eyes
  fill(0);
  circle(x-20, y, 20);
  circle(x+20, y, 20);
  fill(255);
  circle(x-25, y-5, 5);
  circle(x+25, y-5, 5);
  //mouth
  fill(200,50,50,200);//200 for 반투명
  ellipse(x, y+23, 60, 20);
}

//박세혁
void face1(float x, float y, int sizefac) {
    fill(255,231,211);
    circle(x, y, sizefac);
    fill(0);
    arc(x, y, sizefac, sizefac, 5*QUARTER_PI, 7*QUARTER_PI, CHORD);
    
    noFill();
    arc(x-sizefac/4.5, y-sizefac/6, sizefac/3, sizefac/6, 0, PI);
    arc(x+sizefac/4.5, y-sizefac/6, sizefac/3, sizefac/6, 0, PI);
    
    arc(x, y + sizefac/15, sizefac/3, sizefac/4.5, QUARTER_PI, 3*QUARTER_PI);
}

//김원효
void star(float x,float y, int colorfac){
  stroke(0);
  if (colorfac==0) {
    fill(200,0,0);
  } else if (colorfac==1) {
    fill(0,200,0);
  } else if (colorfac==2) {
    fill(0,0,200);
  }
  strokeWeight(3);
  beginShape();
  vertex(x+30,y-230);
  vertex(x-33,y-60);
  vertex(x-135,y-1);
  vertex(x-149,y+21);
  vertex(x-126,y+13);
  vertex(x-53,y+12);
  vertex(x-78,y+200);
  vertex(x+4,y+119);
  vertex(x+77,y+200);
  vertex(x+72,y+81);
  vertex(x+107,y+96);
  vertex(x+61,y-46);
  endShape(CLOSE);
  line(x+72, y+81, x+64, y+23);   // 다리 위 선
  line(x+12, y-108, x+7, y-74);   // 눈
  line(x+36, y-103, x+32, y-72); 
  arc(x+17, y-64, 40, 20, PI*2/8, PI*6/8);  // 입
}