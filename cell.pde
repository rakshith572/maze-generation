class cell{
 int i;
 int j;
 boolean top=true;
 boolean right=true;
 boolean bottom=true;
 boolean left=true;
 boolean visited=false;
 cell(int i,int j){
   this.i=i;
   this.j=j;
 }
 void highLight(){
   int x=i*w;
   int y=j*w;
   noStroke();
    fill(0, 0, 255, 100);
   rect(x,y,w,w);
 }
 cell checkNeighbour(){
    ArrayList<cell>neighbour=new ArrayList<cell>(); 
    cell topC=grid.get(index(i-1,j));
    cell rightC=grid.get(index(i,j+1));
    cell bottomC=grid.get(index(i+1,j));
    cell leftC=grid.get(index(i,j-1));
    if( topC!=null && topC.visited==false){
      neighbour.add(topC);
    }
    if(rightC!=null && rightC.visited==false){
      neighbour.add(rightC);
    }
    if(bottomC!=null && bottomC.visited==false){
      neighbour.add(bottomC);
    }
    if(leftC!=null && leftC.visited==false){
      neighbour.add(leftC);
    }
    if(neighbour.size()>0){
      int t=floor(random(0,neighbour.size()));
      return neighbour.get(t);
    }else{
     return  null; 
    }
 }
 void show() {
    int x = this.i*w;
    int y = this.j*w;
    stroke(255);
    if (top) {
      line(x,y,x + w, y);
    }
    if (right) {
      line(x + w, y, x + w, y + w);
    }
    if (bottom) {
      line(x + w, y + w, x , y + w);
    }
    if (left) {
      line(x,y + w,x,y);
    }
    if(this.visited){
      noStroke();
      fill(255,0,255,100);
      rect(x,y,w,w);
    }
  }
}
