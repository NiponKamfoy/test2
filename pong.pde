void setup(){
  size(1200,600);
}

void draw(){

}

class PongGame{
  
}

class PongBall{
  float positionX, positionY, speed;
  
  PongBall(){
    this.positionX = 600 ;
    this.positionY = 300 ;
    this.speed = 2 ;
  }
  
  void move() {
 
  }
  
}

class PongPaddle_Left{
  float positionX, positionY, width, height;
  
  PongPaddle_Left(float positionY, float sizeX, float sizeY){
    this.positionX = 0 ;
    this.positionY = positionY;
    this.width = sizeX;
    this.height = sizeY;
  } 
  
  void bounce_ball(){
  
  }
}

class PongPaddle_Right{
  float positionX, positionY, width, height;
  
  PongPaddle_Right(float positionY, float sizeX, float sizeY){
    this.positionX = 600 ;
    this.positionY = positionY;
    this.width = sizeX;
    this.height = sizeY;
  } 
  
  void bounce_ball(){
  
  }
}
