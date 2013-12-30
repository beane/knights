##Knight Path Finder

This code finds the shortest path that a knight can take between any two squares on a chess board.

It generates a tree of all the paths the knight could take from a given start position in a breadth-first manner. The path is found by looking up the target square (breadth-first search) and tracing back its path.

##Tree Node

The path finder relies on a TreeNode class that implements BFS and DFS for an arbitrary number of child nodes.