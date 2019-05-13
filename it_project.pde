import java.util.List;
import java.util.ArrayList;

//Global Field
Player Myplayer;
List blockList;
int blockNum=0;
boolean isKeyPressed=false;
static final float interval = 400;
float interval_count = 50;
float speed = 2 ;
float speed_increase = 0.001;
Block temp;
boolean isGameOver=false;
 //moving distance per draw
float dist=1, updist=6;

class Player{
  //default position
  public final float x_position = 50;
  public float y_position;
  public final float icon_width = 100;
  //player Image
  PImage player_image;
  
  Player(){
    player_image=loadImage("airplane.png");
    y_position=200;
  }
  
  void MoveUp(){
    if(y_position<=50) return;
    y_position-=updist;
  }
  void MoveDown(){
    if (y_position>=350) return;
    y_position+=dist;
  }
  void Display(){
    image(player_image, x_position, y_position, icon_width, icon_width);
  }
}

class Block{
  private static final int block_wid = 80;
  private float x_position, y_position;
  private int block_h;
  
  Block(){
    //define height of Block randomly
    block_h=80+(int)(Math.random()*160);
    
    //define position of New Block
     x_position=800;
    if(Math.random()<0.5) y_position=450-block_h; //1.downBlock
    else y_position=50; //2.upBlock
    
    blockNum++;
  }
  void Move(){
    x_position-=speed;
  }  
  void Display(){
    fill(255);
    rect(x_position,y_position,block_wid,block_h);
  }
  boolean isOutScreen(){
    if((x_position+block_wid)<=0) return true;
    return false;
  }
  boolean isCrash(){
    //detect crash code
    return false;
  }
}

void setup(){
  size(800,500);
  
  //make object and list
  Myplayer=new Player();
  blockList=new ArrayList<Block>();
}

void draw(){
  speed+=speed_increase;
  updist+=speed_increase;
  
  //draw bg, black Up, Down Box
  fill(0);
  rect(0,0,800,500);
  fill(255);
  rect(0,0,800,50);
  rect(0,450,800,50);
  
  //detect crash
  for(int i=0;i<blockNum;i++){
    temp=(Block)blockList.get(i);
    if(temp.isCrash()){ //gameover
      isGameOver=true;
      return;
    }
    temp.Move(); //move block to left
    temp.Display();
  }
  
  //detect OutScreen
  if(blockNum!=0 && ((Block)blockList.get(0)).isOutScreen()){
    blockList.remove(0);
    blockNum--;
  }
  
  //Make New Block
  interval_count+=speed;
  if(interval_count>=interval){
    println("make new Block");
    blockList.add(new Block());
    interval_count=0;
    println("blockNum:"+blockNum);
  }
  
  //displayPlayer
  Myplayer.Display();
  
  //temp code
  if(isKeyPressed) isKeyPressed=false;
  else Myplayer.MoveDown();
}

void keyPressed(){
  Myplayer.MoveUp();
  isKeyPressed=true;
}
