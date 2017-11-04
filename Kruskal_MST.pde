import java.util.*;

Graph g = new Graph();

void setup() {
  size(1024, 720);
  //fullScreen();
  background(0);
  Driver();
  //g.PrintVertices();
  g.DrawGraph();
}

void Driver() {
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
}