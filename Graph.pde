class Graph
{
  ArrayList<Edge> edges = new ArrayList();
  SortedSet<Integer> nodeNums = new TreeSet();
  Set<Node> nodes = new HashSet();

  final Random random = new Random();
  
  int nodesCount, edgesCount;
  
  public void AddEdge(int nodeA, int nodeB, int weight) 
  { 
    edges.add(new Edge(nodeA, nodeB, weight));
    
    nodeNums.add(nodeA);
    nodeNums.add(nodeB); 
  }
  
  public Node FindNode(int num)
  {
    Node nodeWithNum = new Node();
    
    for(Node node: nodes) 
    {
      //println(node.nodeNum + " " + num);
      if(node.nodeNum == num) return node;
    }
    
    return nodeWithNum;
  }

  public ArrayList<Edge> FindEdges(Set<Integer> availableNodeNums)
  {
    ArrayList<Edge> edgesWithNode = new ArrayList();

    for(int nodeNum: availableNodeNums)
    {
      for(Edge edge: edges)
      {
        if(edge.nodeAnum == nodeNum || edge.nodeBnum == nodeNum) edgesWithNode.add(edge);
      }
    }
    
    //for(Edge edge: edgesWithNode) println(edge.nodeAnum + " " + edge.nodeBnum);

    return edgesWithNode;
  }
  
  public void DrawGraph()
  {
    DrawNodes();
    DrawEdges(edges, 255, 255, 255, 2);
  }
  
  public void DrawNodes()
  {
    int i = 0;
    
    for(int nodeNum: nodeNums)
    {
      Node node = new Node(nodeNum);
      nodes.add(node);
      node.GetNodePos(nodeNums.size(), i);
      node.DrawNode();
      i++;
    }
  }
  
  public void DrawEdges(ArrayList<Edge> edges, int colourR, int colourG, int colourB, int weight)
  {
    for(Edge edge: edges)
    {
      edge.DrawEdge(nodes, colourR, colourG, colourB, weight);
    }
    
    //for(Edge edge: edges) println(edge.nodeAnum + " " + edge.nodeBnum + " " + edge.weight);
  }

  public void MST()
  {
    ArrayList<Edge> possibleEdges = new ArrayList();
    Set<Integer> mstNodeNums = new HashSet();
    ArrayList<Edge> mstEdges = new ArrayList();
    int mstWeight = 0;

    Boolean firstNode = true;

    while(mstEdges.size() != nodes.size() - 1)
    {
      if(firstNode)
      {
        int i = 0;
        int k = random.nextInt(nodeNums.size());

        for(Integer nodeNum: nodeNums)
        {
          if (i == k) mstNodeNums.add(nodeNum);
          i++;
        }

        for(int nodeNum: mstNodeNums) println("Starting from node: " + nodeNum);

        firstNode = false;
      }

      possibleEdges = FindEdges(mstNodeNums);
      
      Collections.sort(possibleEdges);
      
      for(Edge edge: possibleEdges)
      {
        int connections = 0;
        
        for(int node: mstNodeNums) 
        {
          if(edge.nodeAnum == node || edge.nodeBnum == node) connections++;
        }

        if(connections != 1) continue;

        mstEdges.add(edge);
        mstNodeNums.add(edge.nodeAnum);
        mstNodeNums.add(edge.nodeBnum);
        mstWeight += edge.weight;

        println("Added edge " + edge.nodeAnum + " - " + edge.nodeBnum + ", w = " + edge.weight + " to MST.");

        break;
      }
    }

    println("Total weight of MST = " + mstWeight);
    DrawEdges(mstEdges, 0, 255, 0, 4);
  }  
}