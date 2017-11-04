class Vertex {
  public int vertexNum;
  public float posX;
  public float posY;
  
  Vertex() {
  }
  
  Vertex(int vertexNum) {
    this.vertexNum = vertexNum;
  }
  
  public void GetVertexPos(int verticesCount, int verticesProcessed) {
      float angle = 360/verticesCount * verticesProcessed;
      float radius = 250;
      
      this.posX = cos(radians(angle)) * radius + width / 2;
      this.posY = sin(radians(angle)) * radius + height / 2;
  }
  
  public void DrawVertex() {
      stroke(255);
      noFill();
      
      ellipseMode(CENTER);
      ellipse(posX, posY, 55, 55);
      
      PFont font = loadFont("YuGothicUI-Semilight-25.vlw");
      textFont(font);
      textAlign(CENTER, CENTER);
      text(vertexNum, posX, posY);
  }
}