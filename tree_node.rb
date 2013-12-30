class TreeNode
  attr_accessor :parent, :value, :children #:size

  def initialize(parent=nil, value)
    @parent = parent
    @value = value
    @children = []
    self.parent.children << self if self.parent
    #@size = 0
  end

  def add_child(node)
    #@children.parent = nil unless left.nil?
    @children << node
    node.parent = self
  end

  def dfs(target_value, &block)

    block = Proc.new { |result| result == target_value } unless block

    return self if block.call(self.value)

    result = nil

    children.each do |node|
      result = node.dfs(target_value,&block) if node.children && result.nil?
    end

    result
  end

  def bfs(target_value, &block)
    block = Proc.new { |result| result == target_value } unless block

    searched = [self]
    until searched.empty?
      first = searched.shift
      return first if block.call(first.value)

      first.children.each do |child|
        searched << child
      end
    end
  end

  def path
    return [self.value] if self.parent.nil?
    return self.parent.path << self.value if self.parent
  end

  def to_s
    "Value: #{@value}"
  end

  def self.test
    root = TreeNode.new(0)
    child_one = TreeNode.new(root,1)
    child_two = TreeNode.new(root,4)
    child_three = TreeNode.new(root, 5)

    one_child_one = TreeNode.new(child_one, 2)
    one_child_two = TreeNode.new(child_one, 4)

    p root.dfs(4).path
  end
end

if $PROGRAM_NAME == __FILE__
  TreeNode.test
  # root = TreeNode.new(1)
  # r_one = root.add_child(TreeNode.new(2))
  # r_one_one = r_one.add_child(TreeNode.new(3))
  # r_two = root.add_child(TreeNode.new(9))
  # r_two_two = r_two.add_child(TreeNode.new(9))
  # what = r_two_two.add_child(TreeNode.new(10))
  # w = what.add_child(TreeNode.new(45))

  #root.display
end










