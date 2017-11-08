class Edge implements Comparable<Edge>
{
  int nodeAnum, nodeBnum, weight;
  Edge()
  {
    
  }
  
  public int compareTo(Edge compareEdge)
  {
    return Integer.compare(this.weight, compareEdge.weight);
  }
  
  Edge(int nodeAnum, int nodeBnum, int weight)
  {
    this.nodeAnum = nodeAnum;
    this.nodeBnum = nodeBnum;
    this.weight = weight;
  }
  
  public void DrawEdge(Set<Node> nodes, int colourR, int colourG, int colourB)
  {
    Node nodeB = g.FindNode(this.nodeBnum);
    //println(nodeB.nodeNum);
    
    for(Node node: nodes)
    {
      if(node.nodeNum == this.nodeAnum)
      {
        float wPosX = (node.posX + nodeB.posX) / 2;
        float wPosY = (node.posY + nodeB.posY) / 2;
        
        stroke(colourR, colourG, colourB);
        strokeWeight(2);
        line(node.posX, node.posY, nodeB.posX, nodeB.posY);
        
        fill(255);
        ellipseMode(CENTER);
        ellipse(wPosX, wPosY, 15, 15);
        
        fill(0);
        PFont font = loadFont("YuGothicUI-Semilight-11.vlw");
        textFont(font);
        textAlign(CENTER, CENTER);
        text(this.weight, wPosX, wPosY);
      }
    }
  }
}