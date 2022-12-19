# frozen_string_literal: true

module Year2022
  class Day16 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def open_current_valve(current_valve, opened_valves, time_left, other_players)
      ans = 0
      current_valve_closed = (opened_valves & (1 << current_valve)).zero?
      if current_valve_closed && (@rates[current_valve]).positive?
        new_opened_values = opened_valves | (1 << current_valve)
        ans = ((time_left - 1) * @rates[current_valve]) +
              score(current_valve, new_opened_values, time_left - 1, other_players)
      end

      ans
    end

    def score(current_valve, opened_valves, time_left, other_players)
      if time_left.zero?
        return other_players.positive? ? score(@pipe_graph.start_node.index, opened_valves, 26, other_players - 1) : 0
      end

      key = "#{current_valve} #{opened_valves} #{time_left} #{other_players}"
      return @dp[key] if @dp.key?(key)

      ans = open_current_valve(current_valve, opened_valves, time_left, other_players)

      @edges[current_valve].each do |neighbor|
        ans = [ans, score(neighbor, opened_valves, time_left - 1, other_players)].max
      end

      @dp[key] = ans

      ans
    end

    def part_1
      data
      score(@pipe_graph.start_node.index, 0, 30, 0)
    end

    def part_2
      data
      score(@pipe_graph.start_node.index, 0, 26, 1)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line
    # end

    def parse_rate(line)
      line.split[4].split(Regexp.union(['=', ';']))[1].to_i
    end

    def parse_neighbor_names(line)
      line.split[9..].map { |x| x[0..1] }
    end

    # Processes the dataset as a whole
    def process_dataset(set)
      @pipe_graph = PipeGraph.new
      set.each_with_index do |line, index|
        name = line.split[1]

        rate = parse_rate(line)

        neighbor_names = parse_neighbor_names(line)

        @pipe_graph.add_pipe(name: name, rate: rate, neighbor_names: neighbor_names, index: index)
      end

      @pipe_graph.nodes = @pipe_graph.nodes.sort_by(&:index)

      @dp = {}

      @rates = @pipe_graph.nodes.map(&:rate)

      @edges = @pipe_graph.nodes.map do |node|
        node.neighbors.map(&:index)
      end

      @pipe_graph
    end
  end
end

class PipeGraph
  attr_accessor :nodes

  def initialize
    @nodes = []
    @all_paths = []
  end

  def add_pipe(name:, rate:, neighbor_names:, index:)
    new_node = add_node(name)
    new_node.rate = rate
    new_node.index = index

    neighbor_names.each do |neighbor_name|
      new_node.add_edge(add_node(neighbor_name))
    end
  end

  def start_node
    find_node('AA')
  end

  private

  def add_node(name)
    new_node = find_node(name)
    if new_node.nil?
      new_node ||= CaveNode.new(name)
      @nodes << new_node
    end

    new_node
  end

  def find_node(name)
    @nodes.find { |node| node.name == name }
  end
end

class CaveNode
  attr_accessor :name, :neighbors, :rate, :index

  def initialize(name)
    @name = name
    @neighbors = Set[]
  end

  def display
    "name: #{@name} #{index}, rate: #{@rate}\n\t#{@neighbors.map(&:name)}\n\t#{@neighbors.map(&:index)}"
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
