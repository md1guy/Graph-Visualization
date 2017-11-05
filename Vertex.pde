class Vertex 
{
  public int vertexNum;
  public float posX;
  public float posY;
  
  final Random random = new Random();
  
  Vertex() 
  {
    
  }
  
  Vertex(int vertexNum) 
  {
    this.vertexNum = vertexNum;
  }
  
  public void GetVertexPos(int verticesCount, int verticesProcessed) 
  {
      float angle = (360 / verticesCount + 0) * verticesProcessed;
      float radius = 250;
      
      this.posX = cos(radians(angle)) * radius + width / 2;
      this.posY = sin(radians(angle)) * radius + height / 2;
      
      /*this.posX = random.nextFloat() * (width - 55) + 55;
      this.posY = random.nextFloat() * (height - 55) + 55;*/
  }
  
  public void DrawVertex() 
  {
      stroke(255);
      strokeWeight(2);
      //fill(0);
      noFill();
      
      ellipseMode(CENTER);
      ellipse(posX, posY, 55, 55);
      
      PFont font = loadFont("YuGothicUI-Semilight-25.vlw");
      textFont(font);
      textAlign(CENTER, CENTER);
      text(vertexNum, posX, posY);
  }
}