PongBall pongball;
PongPaddle_Left paddleL;
PongPaddle_Right paddleR;

void setup(){
  background(0);
  size(1200,600);
  rectMode(CENTER);
  rect(600, 300, 10, height);
  pongball = new PongBall();
  paddleL = new PongPaddle_Left(300, 25, 200) ;
  paddleR = new PongPaddle_Right(300, 25, 200) ;
}

void draw(){
 
  

}

class PongGame{
  
  void update(){
    
  }
  
  void serveBall(){
    
  }
}

class PongBall{
  float positionX, positionY, speed, direction;
  
  PongBall(){
    this.positionX = 600 ;
    this.positionY = 300 ;
    this.speed = 2 ;
    this.direction = 0;
    circle(this.positionX, this.positionY, 50);
  }
  
  void move() {
    this.positionX += speed * direction ;
    this.positionY += speed * direction ;
  }
  
}

class PongPaddle_Left{
  float positionX, positionY, width, height;
  
  PongPaddle_Left(float positionY, float sizeX, float sizeY){
    this.positionX = 0 ;
    this.positionY = positionY;
    this.width = sizeX;
    this.height = sizeY;
    rect(this.positionX, this.positionY, this.width, this.height);
  } 
  
  void bounce_ball(){
  
  }
}

class PongPaddle_Right{
  float positionX, positionY, width, height;
  
  PongPaddle_Right(float positionY, float sizeX, float sizeY){
    this.positionX = 1200 ;
    this.positionY = positionY; 
    this.width = sizeX;
    this.height = sizeY;
    rect(this.positionX, this.positionY, this.width, this.height);
  } 
  
  void bounce_ball(){
  
  }
}
