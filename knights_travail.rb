require './tree_node.rb'
class KnightPathFinder
  attr_accessor :move_tree

  MOVES = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

  def initialize(start_pos)
    @move_tree = build_move_tree(start_pos)
  end

  def build_move_tree(start_pos)
    root = TreeNode.new(start_pos)
    current_pos = start_pos
    current_node = root
    visited_nodes = [start_pos]
    nodes_to_visit = [current_node]

    until nodes_to_visit.empty?
      current_node = nodes_to_visit.shift
      current_pos = current_node.value

      new_move_positions(current_pos).each do |pos|
        next if visited_nodes.include?(pos)

        visited_nodes << pos
        nodes_to_visit << TreeNode.new(current_node, pos)
      end
    end

     root
  end

  def find_path(target)
    final = self.move_tree.bfs(target)
    final.path
  end

  def new_move_positions(pos)
    x, y = pos
    m = MOVES.map { |pos| [pos[0]+x, pos[1]+y] }
    m.select do |pos|
      is_legal_move?(pos)
    end
  end

  def is_legal_move?(pos)
    x, y = pos
    x.between?(0,7) && y.between?(0,7)
  end
end

if $PROGRAM_NAME == __FILE__
  kfs = KnightPathFinder.new([0, 0])
  p kfs.find_path([7, 7])
end