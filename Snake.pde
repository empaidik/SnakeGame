
 enum Direction{
   up, down, left, right,
 };
 Direction direction =Direction.down;
class Snake{
 ArrayList<PVector> boxPos = new ArrayList<PVector>();
 float[][] radius = { 
     { board.boxWidth, board.boxHeight,0,0},
     {0,0, board.boxWidth, board.boxHeight}, 
     {0, board.boxHeight, board.boxWidth,0}, 
     {board.boxWidth, 0, 0, board.boxHeight} };
 Snake(){
  boxPos.add(new PVector(board.boxWidth * board.nx/2, board.boxHeight * board.ny/2)); 
   
 }
int k = 0; 
 void render(){
   stroke(255);
   strokeWeight(5);
   PVector temp;
  for( PVector pos : boxPos){
     fill(255, 0, 0);
     
     
     if(boxPos.indexOf(pos) == boxPos.size()-1 ){
         rect(pos.x, pos.y, board.boxWidth, board.boxHeight,radius[k][0],radius[k][1],radius[k][2],radius[k][3]);
         //fill(255);
         //circle(pos.x+board.boxWidth/4, pos.y+board.boxHeight/4,10);   
   }
     else
     rect(pos.x, pos.y, board.boxWidth, board.boxHeight);
  }
  
  temp = boxPos.get(boxPos.size()-1);
  
  for( PVector pos : boxPos){
   if( boxPos.indexOf(pos) == boxPos.size() -1 )break;
   if( temp.x == pos.x && temp.y == pos.y){
     text("Game over", width/2, height/2);
     stop();
   }
  }
  
   if(temp.x == board.scorePoint.x && temp.y == board.scorePoint.y){
      boxPos.add(new PVector(temp.x, temp.y));
      board.changeHealthLocation();
   }
  
   float tempX=0,tempY=0;
   switch(direction){
    case up:
       temp = boxPos.get(boxPos.size()-1);
       tempY = temp.y;
      if(temp.y <= board.posY)tempY = board.posY + board.Height;
      boxPos.add(new PVector(temp.x, tempY - board.boxHeight));
      boxPos.remove(0);
      k =0;
       break;
      case down:
       temp = boxPos.get(boxPos.size()-1);
       tempY = temp.y;
       if(temp.y >= board.posY + board.Height - board.boxHeight)tempY = board.posY - board.boxHeight;
      boxPos.add(new PVector(temp.x, tempY + board.boxHeight));
      boxPos.remove(0);
      k = 1;
      break;
      case left:
      
       temp = boxPos.get(boxPos.size()-1);
       tempX = temp.x;
       if(temp.x <= board.posY)tempX = board.posX + board.Width;
      boxPos.add(new PVector(tempX - board.boxWidth, temp.y));
      boxPos.remove(0);
      k = 3;
      break;
          case right:
       temp = boxPos.get(boxPos.size()-1);
      tempX= temp.x;
       if(temp.x >= board.Width + board.posX - board.boxWidth)tempX = board.posX-board.boxWidth;
      boxPos.add(new PVector(tempX + board.boxHeight, temp.y));
      boxPos.remove(0);
      k = 2;
      break;
     default:
       break;
    
     
   }
}
 }
 
 
 
  
 
