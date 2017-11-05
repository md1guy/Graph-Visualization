class Edge {
  public int startVertexNum;
  public int endVertexNum;
  public int weight;
  
  Edge() {
  }
  
  public Edge(int startVertexNum, int endVertexNum, int weight) {
    this.startVertexNum = startVertexNum;
    this.endVertexNum = endVertexNum;
    this.weight = weight;
  }
  
  public void DrawEdge(ArrayList<Vertex> vertices, ArrayList<Edge> edges)
  {
    Graph g = new Graph();
    g.vertices = vertices;
    
    for(Edge edge: edges) {
      int endVertexNum = edge.endVertexNum;
      Vertex endVertex = g.FindVertix(endVertexNum);
      
      for(Vertex vertice: vertices){
        
        if(vertice.vertexNum == edge.startVertexNum) {
          
          float wPosX = (vertice.posX + endVertex.posX) / 2;
          float wPosY = (vertice.posY + endVertex.posY) / 2;
          
          line(vertice.posX, vertice.posY, endVertex.posX, endVertex.posY);
          
          fill(255);
          ellipseMode(CENTER);
          ellipse(wPosX, wPosY, 15, 15);
          
          fill(0);
          PFont font = loadFont("YuGothicUI-Semilight-11.vlw");
          textFont(font);
          textAlign(CENTER, CENTER);
          text(edge.weight, wPosX, wPosY);
        }
      }
    }
  }
}