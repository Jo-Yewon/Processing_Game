
//screen size
static final int screen_width = 1200;
static final int screen_height = 800;

class Player{
  //default position
  public final float x_position = 100;
  public float y_position = 350;
  public final float icon_width = 30;
  public final float icon_height = 30;
  
  //player Image
  PImage player_image;
  
  Player(){
    player_image=loadImage("airplane.png");
  }
  
  //up distance per draw
  public final float dist= 0.1;
  
  void MoveUp(){
    y_position+=dist;
  }
  void MoveDown(){
    y_position-=dist;
  }
  void Display(){
    image(player_image, x_position, y_position, icon_width, icon_height);
  }
}

Player Myplayer;

void setup(){
  size(800,500);
  
  //draw black Up, Down Box
  fill(0);
  rect(0,0,1200,50);
  rect(0,450,1200,50);
  
  //make object
  Myplayer=new Player();
}

void draw(){
  Myplayer.Display();
}
