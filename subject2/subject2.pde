float x0,y0,x1,y1,x2,y2;
float vx0,vy0,vx1,vy1,vx2,vy2;
void setup(){
  size(800,600);
  initialize_random_pos();
  vx0=vx1=vx2=7; vy0=vy1=vy2=7;
  //face
}

void draw() {
  background(240);
  x0 += vx0; x1 += vx1; x2 += vx2; y0 += vy0; y1 += vy1; y2 += vy2;
  
  vx0 = restrictX(x0, vx0);
  vy0 = restrictY(y0, vy0);
  vx1 = restrictX(x1, vx1);
  vy1 = restrictY(y1, vy1);
  vx2 = restrictX(x2, vx2);
  vy2 = restrictY(y2, vy2);
    
  face0(x0,y0);
  face1(x1,y1);
  star(x2,y2);
}

void mouseClicked() {
  initialize_random_pos();
}

void initialize_random_pos() {
  x0=400+random(-300,250);
  x1=400+random(-300,250);
  x2=400+random(-300,250);
  y0=300+random(-300,250);
  y1=300+random(-300,250);
  y2=300+random(-300,250);
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
void face1(float x, float y) {
    fill(255,231,211);
    circle(x, y, 100);
    fill(0);
    arc(x, y, 100, 100, 5*QUARTER_PI, 7*QUARTER_PI, CHORD);
    
    noFill();
    arc(x-100/4.5, y-100/6, 100/3, 100/6, 0, PI);
    arc(x+100/4.5, y-100/6, 100/3, 100/6, 0, PI);
    
    arc(x, y + 100/15, 100/3, 100/4.5, QUARTER_PI, 3*QUARTER_PI);
}

//김원효
void star(float x,float y){
  stroke(0);
  fill(0,0,204);
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