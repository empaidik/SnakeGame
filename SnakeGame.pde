Board board;
Snake snake;
void setup(){
  size(600, 600);
  board = new Board(500, 500, 25, 25);
  snake = new Snake();
  frameRate(10);
}
void draw(){
  background(#e9e9e9);
  board.render();
 snake.render();
}

void keyPressed(){
  
 switch(keyCode){
  case UP:
       if(direction == Direction.down)break;
    direction = Direction.up;
    break;
   case DOWN:
     if(direction == Direction.up)break;
    direction = Direction.down;
    break;
   case LEFT:
        if(direction == Direction.right)break;
    direction = Direction.left;
    break;
   case RIGHT:
        if(direction == Direction.left)break;
    direction = Direction.right;
    break;
   default:
   break;
 }
}
void mousePressed(){
 //stop(); 
}
