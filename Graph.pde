class Graph {
  ArrayList<Edge> edges = new ArrayList();
  Set<Integer> vertexNums = new HashSet();
  ArrayList<Vertex> vertices = new ArrayList();
  public int verticesDrawn = 0;
  
  public void AddEdge(int startVertex, int endVertex, int weight) {
    Edge edge = new Edge(startVertex, endVertex, weight);
    vertexNums.add(startVertex);
    vertexNums.add(endVertex);
    edges.add(edge);
  }
  
  public void CreateVertices(){
    for(int vertexNum: vertexNums) {
      Vertex vertex = new Vertex(vertexNum);
      vertices.add(vertex);
      println(vertex.vertexNum);
    }
    
    for(Vertex vertex: vertices) println(vertex.vertexNum);
    
    int i = 0;
    
    for(Vertex vertex: vertices) {
      vertex.GetVertexPos(vertexNums.size(), i);
      i++;
    }
  }
  
  public Vertex FindVertix(int num){
    Vertex vertexWithNum = new Vertex();
    for(Vertex vertex: vertices) {
      if(vertex.vertexNum == num)
      return vertex;
    }
    
    return vertexWithNum;
  }
  
  public void DrawGraph(){
    Edge e = new Edge();
    CreateVertices();
    //for(Vertex vertex: vertices) println(vertex.vertexNum);
    for(Vertex vertex: vertices) vertex.DrawVertex();
    e.DrawEdge(vertices, edges); }
}