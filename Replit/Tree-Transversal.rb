# Tree Transversal

# You will be given an array as input, which represents a Tree. Process the array into a Tree of Nodes, as shown above. Then go through the tree and print it in post-order.
# Print each number space-separated.

# https://repl.it/student/submissions/10563821

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def pre_order(node)
  if node == nil
    return ''
  end

  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def post_order(node)
  array = post_order_helper(node, [])
  string = ""
  array.each do |i|
    string << "#{i} "
  end
  return string
end

def post_order_helper(node, array)
  post_order_helper(node.left, array) unless node.left.nil?
  post_order_helper(node.right, array) unless node.right.nil?
  array << node.data
  return array
end

tree = array_to_tree([10, 1, 2, 3, 4, 5, 6], 0)
puts post_order(tree)
#=> 3 4 1 5 6 2 10