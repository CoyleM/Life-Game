int[] location=new int[3];
int[] locationstate1=new int[9];
int[] locationstate2=new int[9];
int index;
int x;
int y;
int a;
int b;
void setup() {
  size(300, 350);
  background(255);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(0, 300, 300, 300);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  for (y=0; y<3; y++) {
    location[y]=50+100*y;
  }
  for (y=0; y<9; y++) {
    locationstate1[y]=0;
  }
  for (y=0; y<9; y++) {
    locationstate2[y]=0;
  }
}
void mouseClicked() {

  if ((mouseY<300)&&(mouseX<300)) {
    for (a=0; a<3; a++) {
      if ((mouseX>location[a]-50)&&(mouseX<location[a]+50)) {
        x=a;
      }
    }
    for (b=0; b<3; b++) {
      if ((mouseY>location[b]-50)&&(mouseY<location[b]+50)) {
        y=b;
      }
    }
    if (locationstate2[x+3*y]==0) {
      locationstate2[x+3*y]=1;
      boolean pan=false;
      for (a=0; a<9; a++) {
        if (locationstate2[a]==0) {
          pan =true;
          break;
        }
      }
      if (pan) {
        movement();
      }
      if (!pan) {
        for (a=0; a<9; a++) {
          locationstate2[a]=0;
          locationstate1[a]=0;
        }
      }
    }
  }
}

void draw() {
  judgewinning();
  background(255);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(0, 300, 300, 300);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  for (a=0; a<9; a++) {
    if (locationstate2[a]==1) {
      drawo(a-3*floor(a/3), floor(a/3));
    }
  }
  for (a=0; a<9; a++) {
    if (locationstate2[a]==2) {
      drawx(a-3*floor(a/3), floor(a/3));
    }
  }
}

void drawx(int x, int y) {
  line(location[x]-40, location[y]-40, location[x]+40, location[y]+40);
  line(location[x]-40, location[y]+40, location[x]+40, location[y]-40);
}
void drawo(int x, int y) {
  ellipseMode(CENTER);
  ellipse(location[x], location[y], 80, 80);
}

void judgewinning() {
  if (
  ((locationstate2[0]==1)&&(locationstate2[1]==1)&&(locationstate2[2]==1))
    ||((locationstate2[3]==1)&&(locationstate2[4]==1)&&(locationstate2[5]==1))
    ||((locationstate2[6]==1)&&(locationstate2[7]==1)&&(locationstate2[8]==1))
    ||((locationstate2[0]==1)&&(locationstate2[3]==1)&&(locationstate2[6]==1))
    ||((locationstate2[1]==1)&&(locationstate2[4]==1)&&(locationstate2[7]==1))
    ||((locationstate2[2]==1)&&(locationstate2[5]==1)&&(locationstate2[8]==1))
    ||((locationstate2[2]==1)&&(locationstate2[4]==1)&&(locationstate2[6]==1))
    ||((locationstate2[0]==1)&&(locationstate2[4]==1)&&(locationstate2[8]==1))
    ) {
    //    for (a=0; a<9; a++) {
    //      if (locationstate2[a]==1) {
    //        drawo(a-3*floor(a/3), floor(a/3));
    //      }
    //    }
    //    for (a=0; a<9; a++) {
    //      if (locationstate2[a]==2) {
    //        drawx(a-3*floor(a/3), floor(a/3));
    //      }
    //    }
    for (a=0; a<9; a++) {
      locationstate2[a]=1;
      locationstate1[a]=1;
    }
  }
  if (
  ((locationstate2[0]==2)&&(locationstate2[1]==2)&&(locationstate2[2]==2))
    ||((locationstate2[3]==2)&&(locationstate2[4]==2)&&(locationstate2[5]==2))
    ||((locationstate2[6]==2)&&(locationstate2[7]==2)&&(locationstate2[8]==2))
    ||((locationstate2[0]==2)&&(locationstate2[3]==2)&&(locationstate2[6]==2))
    ||((locationstate2[1]==2)&&(locationstate2[4]==2)&&(locationstate2[7]==2))
    ||((locationstate2[2]==2)&&(locationstate2[5]==2)&&(locationstate2[8]==2))
    ||((locationstate2[2]==2)&&(locationstate2[4]==2)&&(locationstate2[6]==2))
    ||((locationstate2[0]==2)&&(locationstate2[4]==2)&&(locationstate2[8]==2))
    ) {
    //    for (a=0; a<9; a++) {
    //      if (locationstate2[a]==1) {
    //        drawo(a-3*floor(a/3), floor(a/3));
    //      }
    //    }
    //    for (a=0; a<9; a++) {
    //      if (locationstate2[a]==2) {
    //        drawx(a-3*floor(a/3), floor(a/3));
    //      }
    //    }
    for (a=0; a<9; a++) {
      locationstate2[a]=2;
      locationstate1[a]=2;
    }
  }
}

void movement() {
  boolean neq=true;
  while (neq) {
    neq=false;
    for (int i=0; i<9; i++) {
      if (locationstate1[i]!=locationstate2[i]) {
        neq=true;
        break;
      }
    }
    if (neq) {
      a=floor(random(9));
      if (locationstate2[a]==0) {
        locationstate2[a]=2;
        for (int b=0; b<9; b++) {
          locationstate1[b]=locationstate2[b];
        }
      }
    }
  }
}

