import java.util.*;

Graph g = new Graph();
Graph g2 = new Graph();

void setup() 
{
  size(1024, 720);
  //fullScreen();
  background(0);
  Driver();
  //g.PrintVertices();
  g.DrawGraph(); //<>//
  g.Prims_MST();   //<>//
}

void Driver() 
{
   /*g.AddEdge(1, 2, 0);
   g.AddEdge(1, 4, 0);
   g.AddEdge(2, 3, 0);
   g.AddEdge(2, 4, 0);
   g.AddEdge(3, 4, 0);
   g.AddEdge(4, 5, 0);
   g.AddEdge(4, 7, 0);*/

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
   
  //g.AddEdge(12);

  /*g.AddEdge(1, 2, 0);
  g.AddEdge(2, 3, 0);
  g.AddEdge(3, 4, 0);
  g.AddEdge(4, 5, 0);
  g.AddEdge(5, 6, 0);
  g.AddEdge(6, 7, 0);
  g.AddEdge(7, 8, 0);
  g.AddEdge(8, 9, 0);
  g.AddEdge(9, 10, 0);
  g.AddEdge(10, 11, 0);
  g.AddEdge(11, 12, 0);
  g.AddEdge(12, 13, 0);
  g.AddEdge(13, 14, 0);
  g.AddEdge(14, 15, 0);
  g.AddEdge(15, 16, 0);
  g.AddEdge(16, 17, 0);
  g.AddEdge(17, 18, 0);
  g.AddEdge(18, 19, 0);
  g.AddEdge(19, 20, 0);
  g.AddEdge(20, 1, 0);
  
  g.AddEdge(14, 2, 0);
  g.AddEdge(14, 6, 0);
  g.AddEdge(18, 10, 0);
  g.AddEdge(18, 6, 0);
  g.AddEdge(10, 2, 0);*/
  
  /*g.AddEdge(5, 17, 0);
  g.AddEdge(9, 17, 0);
  g.AddEdge(12, 2, 0);*/
}