class Graph {
  ArrayList<Edge> edges = new ArrayList();
  Set<Integer> vertexNums = new HashSet();
  ArrayList<Vertex> vertices = new ArrayList();
  int verticesDrawn = 0;
  
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
    }
    
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
    
    for(Vertex vertex: vertices) vertex.DrawVertex();
    
    e.DrawEdge(vertices, edges); 
  }
  
  public void MST(){
    int[] edgesWeights = new int[edges.size()];
    int[] edgesStartVertices = new int[edges.size()];
    int[] edgesEndVertices = new int[edges.size()];
    
    for(int i = 0; i < edges.size(); i++) edgesWeights[i] = edges.get(i).weight;
    
    Arrays.sort(edgesWeights);
    Set<Integer> edgesWeightsSet = new HashSet();
    
    for(int edgeWeight: edgesWeights) edgesWeightsSet.add(edgeWeight);
    
    //for(int e: edgesWeightsSet) println(e);
  }
}