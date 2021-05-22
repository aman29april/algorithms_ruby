class Vertice
  def initialize(name)
    @children = []
    @name = name
  end

  def add_child(name)
    @children << Node.new(name)
  end
end

class Graph
  def initialize
    @vertices = []
  end

  def add_edge(node_a, node_b)
    node_a.adjacents << node_b
    node_b.adjacents << node_a
  end
end
