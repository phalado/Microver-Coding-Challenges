# Stacks or Recursion

# Find How Tall is the Tree? by using a Stack and a Loop.

# https://repl.it/student/submissions/10588621

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i=0)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def get_height(node, height, max_height)
  height += 1
  max_height = height if height > max_height
  max_height = get_height(node.left, height, max_height) unless node.left.nil?
  max_height = get_height(node.right, height, max_height) unless node.right.nil?
  max_height
end

def tree_height(tree_as_list)
  root = array_to_tree(tree_as_list)
  return get_height(root, 0, 0)
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4