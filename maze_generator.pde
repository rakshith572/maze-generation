ArrayList<cell>grid=new ArrayList<cell>();
ArrayList<cell>stack=new ArrayList<cell>();
int rows;
int columns;
  int w=20;
cell current;
void setup(){
  size(600,600);
  rows=floor(height/w);
  columns=floor(width/w);
  for(int i=0;i<rows;i++){
     for(int j=0;j<columns;j++){
       grid.add(new cell(j,i));
     }
  }
  //frameRate(5);
  current=grid.get(0);
}
void draw(){
  background(51);
  for(int i=0;i<grid.size();i++){
     grid.get(i).show();
  }
  current.visited=true;
  current.highLight();
  cell next=current.checkNeighbour();
  if(next!=null){
    next.visited=true;
    stack.add(current);
    removeWal(current,next);
    current=next;
  }else if(stack.size()>0){
   current=stack.remove(stack.size()-1); 
  }
  
}
int index(int i,int j){
  if(i<0 || j<0 || i>columns-1 || j> rows-1){
    return 0;
  }
  return i+j*columns;
}
void removeWal(cell a,cell b){
   int x=a.i-b.i; 
   if(x==1){
     a.left=false;
     b.right=false;
   }else if(x==-1){
     a.right=false;
     b.left=false;
   }
   int y=a.j-b.j;
   if(y==1){
     a.top=false;
     b.bottom=false;
   }else if(y==-1){
     a.bottom=false;
     b.top=false;
   }
}
