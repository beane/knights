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
end
