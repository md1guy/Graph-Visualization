class Node
  {
    public int nodeNum;
    public float posX;
    public float posY;
    
    Node()
    {
      
    }
    
    Node(int nodeNum) 
    {
      this.nodeNum = nodeNum;
    }
    
    public void GetNodePos(int nodesCount, int nodesProcessed) 
    {
      float angle = (360 / nodesCount + 0) * nodesProcessed;
      float radius = 250;
      
      this.posX = cos(radians(angle)) * radius + width / 2;
      this.posY = sin(radians(angle)) * radius + height / 2;
    }
    
    public void DrawNode() 
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
      text(nodeNum, posX, posY);
    }
  }