require "graph/version"

module Graph
  def initialize name = nil, graph = nil, &block
    @name = name
    @graph = graph
    graph << self if graph
    @nodes_stock = []
    @nodes  = Hash.new { |a,b| @nodes_stock << b; a[b] = Node.new self, b }
    @edges_stock = []
    @edges  = Hash.new { |a,b|
      a[] = Hash.new { |h2, b2|
        @edges_stock << [b, b2]
        a2[b2] = Edge.new self, self[b], self[b2]
      }
    }
    @graph_attribs = []
    @node_attribs  = []
    @edge_attribs  = []
    

    self.scheme = graph.scheme if graph
    node_attribs << scheme if scheme

    instance_eval(&block) if block
	end	
end
	
