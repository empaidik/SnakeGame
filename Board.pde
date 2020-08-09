class Board{
 float Height, Width;
 int nx, ny;
 PVector scorePoint;
 float animationCounter = 0;
 float posX = 50, posY =50;
 float boxWidth, boxHeight;
  Board(float Width, float Height, int nx, int ny){
   this.Height = Height;
   this.Width = Width;
   this.nx = nx;
   this.ny = ny;
   this.boxWidth = Width/nx;
   this.boxHeight = Height/ny;
    changeHealthLocation();
 }
 
 void render(){
  fill(0); 
  rect(posX, posY, Width, Height);
  strokeWeight(0.2);
   stroke(50);
   for(int i=0; i<nx; i++){
     line(posX+i*Width/nx ,posY,posX+i*Width/nx, posY+Height);
   }
   for(int i=0; i<ny; i++){
     line(posX,posY + i*Height/ny, posX+Width, posY + i*Height/ny);
   }
   fill(255, 255, 0);
   ellipseMode(CORNER);
   if(animationCounter % 10 != 0)
   ellipse(scorePoint.x, scorePoint.y, boxWidth, boxHeight);
   animationCounter++;
 }
 void changeHealthLocation(){
       float tempX=0,tempY=0;
      float randX = random(posX, posX + Width);
      float randY = random(posY, posY + Height);
       for(int i=0; i<ny; i++){
         tempX  = int(randX/nx);
          tempY = int(randY/ny);
       }
        scorePoint = new PVector(posX+boxWidth * tempX, posY + boxHeight * tempY);
    
    
    
 }
  
}
