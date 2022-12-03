# frozen_string_literal: true

module Year2021
  class Day12 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      Graph.new(edges: data, double_visit: false).all_paths.length
    end

    def part_2
      Graph.new(edges: data, double_visit: true).all_paths.length
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end

class Graph
  attr_reader :all_paths

  def initialize(edges:, double_visit:)
    @double_visit = double_visit
    @nodes = Set[]
    edges.each do |edge|
      name1, name2 = edge.split('-')
      @nodes.add(Node.new(name1))
      @nodes.add(Node.new(name2))

      node1 = find_node(name1)
      node2 = find_node(name2)

      node1.add_edge(node2)
      node2.add_edge(node1)
    end
    @all_paths = []
    calculate_paths
  end

  private

  def calculate_paths
    path = [start_node]
    all_path_dfs(source: start_node, destination: end_node, path: path, neighbors: start_node.neighbors)
  end

  def all_path_dfs(source:, destination:, path:, neighbors:)
    if source.eql?(destination)
      @all_paths << path.clone
    else
      neighbors.each do |neighbor|
        next unless can_be_added_to_path?(node: neighbor, path: path)

        path << neighbor
        all_path_dfs(source: neighbor, destination: destination, path: path, neighbors: neighbor.neighbors)
        path.pop
      end
    end
  end

  def can_be_added_to_path?(node:, path:)
    return false if node.eql?(start_node)

    if node.small? && path.include?(node)
      return false unless @double_visit

      return false if duplicate_smalls_in_path?(path: path)
    end

    true
  end

  def duplicate_smalls_in_path?(path:)
    path.select(&:small?).map(&:name).tally.values.find { |x| x == 2 }
  end

  def start_node
    find_node('start')
  end

  def end_node
    find_node('end')
  end

  def find_node(name)
    @nodes.to_a.find { |node| node.name == name }
  end
end

class Node
  attr_reader :name, :neighbors

  def initialize(name)
    @name = name
    @neighbors = Set[]
  end

  def small?
    @name.downcase == @name
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end

  def eql?(other)
    self.class == other.class &&
      @name == other.name
  end

  def hash
    @name.hash
  end
end
