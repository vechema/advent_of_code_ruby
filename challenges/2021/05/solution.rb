# frozen_string_literal: true

module Year2021
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def num_dangerous_spots(lines:)
      max_x = lines.max_by(&:max_x).max_x
      max_y = lines.max_by(&:max_y).max_y

      vents = Array.new(max_x + 1) { Array.new(max_y + 1, 0) }
      lines.each do |line|
        line.all_coordinates.each do |x, y|
          vents[x][y] += 1
        end
      end

      vents.flatten.count { |x| !x.nil? && x > 1 }
    end

    def part_1
      num_dangerous_spots(lines: data.select(&:straight?))
    end

    def part_2
      num_dangerous_spots(lines: data)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      coordinates = line.split(Regexp.union([',', ' -> ']))
      VentLine.new(x1: coordinates[0],
                   y1: coordinates[1],
                   x2: coordinates[2],
                   y2: coordinates[3])
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end

class VentLine
  attr_accessor :x1, :y1, :x2, :y2

  # rubocop:disable Naming/MethodParameterName
  def initialize(x1:, y1:, x2:, y2:)
    @x1 = x1.to_i
    @y1 = y1.to_i
    @x2 = x2.to_i
    @y2 = y2.to_i
  end
  # rubocop:enable Naming/MethodParameterName

  def straight?
    x1 == x2 || y1 == y2
  end

  def max_x
    [x1, x2].max
  end

  def min_x
    [x1, x2].min
  end

  def max_y
    [y1, y2].max
  end

  def min_y
    [y1, y2].min
  end

  def self.range(one, two)
    if one <= two
      (one..two).to_a
    else
      one.downto(two).to_a
    end
  end

  def all_coordinates
    return (min_x..max_x).to_a.product((min_y..max_y).to_a) if straight?

    xs = VentLine.range(x1, x2)
    ys = VentLine.range(y1, y2)
    xs.each_with_index.map do |x, index|
      [x, ys[index]]
    end
  end
end
