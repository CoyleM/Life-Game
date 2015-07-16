int[][] state1;
int[][] state2;
int[][] location;
int x;
int y;
int i;
int j;
int k;
boolean jud=false;
void setup(){
  state1 = new int[52][52];
  state2 = new int[52][52];
  size(500,400);
  drawmap();
  for(x=0;x<52;x++){
    for(y=0;y<52;y++){
      state1[x][y]=0;
      state2[x][y]=0;
    }
  }
  
}

void mousePressed(){
  if(jud==false){
    jud=true;
  }
  else if(jud==true){
    jud=false;
  }
//  jud=true;
}

void draw(){
  drawmap();
  x=floor(mouseX/10);
  y=floor(mouseY/10);
  if((mouseY<500)&&(state2[x+1][y+1]==0)){
    state2[x+1][y+1]=1;
  }

  show();
  if(jud==true){
  calculate();
  equal();
  }
  
  

}

void show(){
  for(x=1;x<51;x++){
    for(y=1;y<51;y++){
      if(state2[x][y]==1){
        fill(0,0,0);
        rect(-10+10*x,-10+10*y,10,10);
      }
    }
  }
}

void drawmap(){
  background(255);
  for(x=0;x<510;x=x+10){
    line(x,0,x,500);
    line(0,x,500,x);
  }
}

void equal(){
  for(x=0;x<52;x++){
    for(y=0;y<52;y++){

      state2[x][y]=state1[x][y];
    }
  }
}

void calculate(){
  for(x=1;x<51;x++){
    for(y=1;y<51;y++){
      int i = 0;
      for(j=-1;j<2;j++){
        for(k=-1;k<2;k++){
          if(state2[x+j][y+k]==1){
            i++;
          }
        }
      }
      if(state2[x][y]==1){
        i=i-1;
      }
      if((i<2)||(i>3)){
        state1[x][y]=0;
      }
      if(i==3){
        state1[x][y]=1;
      }
      if(i==2){
        state1[x][y]=state2[x][y];
      }
    }
  }
}
