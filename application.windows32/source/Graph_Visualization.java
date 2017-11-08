import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Graph_Visualization extends PApplet {



Graph g = new Graph();

public void setup()
{
  
  background(0);
  Driver();
  g.DrawGraph();
}

public void draw()
{
  
}

public void keyPressed()
{
  if(keyCode == ENTER)
  {
    g.MST();
  }
}

public void Driver() 
{
   g.AddEdge(1, 2, 7);
   g.AddEdge(1, 3, 2);
   g.AddEdge(1, 4, 1);
   g.AddEdge(2, 5, 2);
   g.AddEdge(2, 7, 1);
   g.AddEdge(3, 5, 7);
   g.AddEdge(3, 6, 4);
   g.AddEdge(4, 6, 3);
   g.AddEdge(4, 7, 5);
   g.AddEdge(5, 8, 4);
   g.AddEdge(5, 9, 5);
   g.AddEdge(6, 8, 6);
   g.AddEdge(7, 9, 3);
   g.AddEdge(7, 10, 3);
   g.AddEdge(8, 11, 7);
   g.AddEdge(9, 11, 4);
   g.AddEdge(10, 11, 4);
   
   
   /*g.AddEdge(14, 2, 0);
   g.AddEdge(14, 6, 4);
   g.AddEdge(18, 10, 1);
   g.AddEdge(18, 6, 3);
   g.AddEdge(10, 2, 0);*/
}
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
    DrawEdges(edges, 255, 255, 255);
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
  
  public void DrawEdges(ArrayList<Edge> edges, int colourR, int colourG, int colourB)
  {
    for(Edge edge: edges)
    {
      edge.DrawEdge(nodes, colourR, colourG, colourB);
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
    DrawEdges(mstEdges, 0, 255, 0);
  }  
}
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
  public void settings() {  size(1024, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#080707", "--stop-color=#A3A5B7", "Graph_Visualization" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
