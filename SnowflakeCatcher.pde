Snowflake[] snowSwag = new Snowflake[250];
int catcherRed = (int)(Math.random()*250)+1;
int catcherBlue = (int)(Math.random()*250)+1;
int catcherGreen = (int)(Math.random()*250)+1;


void setup()
{
  //your code here
  size(500, 500);
  background(0);
  for(int j=0; j<snowSwag.length; ++j){
  snowSwag[j] = new Snowflake();
}
}
void draw()
{
 
for(int x=0; x<snowSwag.length; ++x){
  snowSwag[x].erase();
  snowSwag[x].lookDown();
  snowSwag[x].move();
  snowSwag[x].wrap();
  snowSwag[x].show();
}

if(keyPressed){
  if(key=='r'){
    catcherRed=0;
    catcherGreen=0;
    catcherBlue=0;
  }else{
    catcherRed = (int)(Math.random()*250)+1;
    catcherBlue = (int)(Math.random()*250)+1;
    catcherGreen = (int)(Math.random()*250)+1;

  }
}
}

void mouseDragged()
{
  noStroke();
  fill(catcherRed,catcherGreen,catcherBlue);
  ellipse(mouseX, mouseY, 50, 10);
}



class Snowflake
{
  //class member variable declarations
  int x, y;
  boolean isMoving;

  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    isMoving = true;
  }

  void show()
  {
    stroke(0);
    fill(255);
    ellipse(x, y, 5, 5);
  }

  void lookDown()
  {
    if(y<=490 && y>=0 && (get(x, y+5) != color(0))){
      isMoving=false;
    }else{
      isMoving=true;
    }
  }

  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
  }

  void move()
  {
    if(isMoving==true){
      y++;
    }
  }

  void wrap()
  {
    if(y>=499){
      y = 0;
      x = (int)(Math.random()*501);
    }
  }
}


