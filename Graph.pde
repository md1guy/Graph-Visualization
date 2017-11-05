class Graph 
{
  ArrayList<Edge> edges = new ArrayList();
  ArrayList<Edge> wSortedEdges = edges;
  ArrayList<Edge> mstEdges = new ArrayList();
  
  ArrayList<Vertex> vertices = new ArrayList();
  Set<Integer> vertexNums = new HashSet();
  Set<Integer> verticesInMstNums = new HashSet();
  
  Edge e = new Edge();
  
  final Random random = new Random();
  
  public void AddEdge(int startVertex, int endVertex, int weight) 
  {
    vertexNums.add(startVertex);
    vertexNums.add(endVertex);
    
    Edge edge = new Edge(startVertex, endVertex, weight);
    edges.add(edge);
  }
  
  /*public void AddEdge(int vertexNum) 
  {
    vertexNums.add(vertexNum);
  }*/
  
  public void CreateVertices()
  {
    
    for(int vertexNum: vertexNums) 
    {
      Vertex vertex = new Vertex(vertexNum);
      vertices.add(vertex);
    }
    
    int i = 0;
    
    for(Vertex vertex: vertices) 
    {
      vertex.GetVertexPos(vertexNums.size(), i);
      i++;
    }
  }
  
  public Vertex FindVertix(int num)
  {
    Vertex vertexWithNum = new Vertex();
    
    for(Vertex vertex: vertices) 
    {
      if(vertex.vertexNum == num)
      return vertex;
    }
    
    return vertexWithNum;
  }
  
  public void DrawGraph()
  {
    CreateVertices();
    
    for(Vertex vertex: vertices) vertex.DrawVertex();
    
    //for(Edge edge: edges) e.DrawEdge(edge, vertices, random.nextInt(256), random.nextInt(256), random.nextInt(256)); 
    for(Edge edge: edges) e.DrawEdge(edge, vertices, 255, 255, 255);
    Collections.sort(wSortedEdges);
  }
  
  Boolean firstEntry = true;
  
  public void Prims_MST()
  {
    while(true)
    {
      for(Edge edge: wSortedEdges)
      {
        int check = 0;
        
        if(firstEntry) 
        {
          verticesInMstNums.add(edge.startVertexNum);
          verticesInMstNums.add(edge.endVertexNum);
          mstEdges.add(edge);
          
          println("Added edge " + edge.startVertexNum + " -- " + edge.endVertexNum + ", v = " + edge.weight + " to MST.");
          
          firstEntry = false;
          continue;
        }
        
        for(int verticeNum: verticesInMstNums)
        {
          if(verticeNum == edge.startVertexNum || verticeNum == edge.endVertexNum) check++;
        }
        
        if(check == 1)
        {
          verticesInMstNums.add(edge.startVertexNum);
          verticesInMstNums.add(edge.endVertexNum);
          mstEdges.add(edge);
          
          println("Added edge " + edge.startVertexNum + " -- " + edge.endVertexNum + ", v = " + edge.weight + " to MST.");
        }
      }
      
      if(mstEdges.size() == (vertices.size() - 1)) 
      {
        println("All done jerks, ez.");
        break;
      }
      
      println("Looks like we need more edges, one more time.");
    }
    
    for(Edge edge: mstEdges) e.DrawEdge(edge, vertices, 0, 255, 0);
  }
}