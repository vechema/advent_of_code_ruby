# frozen_string_literal: true

module Year2023
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.numbers_near_symbols.map(&:number).sum
    end

    def part_2
      data.gear_ratios
    end
    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      EngineGrid.new(grid: set)
    end
  end
end

class EngineGrid
  def initialize(grid:)
    @grid = grid
    @parts = create_parts
  end

  def create_parts
    parts = []
    @grid.each_with_index do |row, row_index|
      col_index = 0
      while col_index < row.length
        char = row[col_index]

        number = ''
        if number?(char)
          start_col_index = col_index
          loop do
            number += row[col_index]
            col_index += 1
            break unless number?(row[col_index])
          end
          parts << PartNumber.new(
            number: number.to_i,
            col: start_col_index,
            row: row_index
          )
        else
          col_index += 1
        end
      end
    end
    parts
  end

  def numbers_near_symbols
    used_parts = Set.new
    @grid.each_with_index do |row, row_index|
      row.chars.each_with_index do |char, col_index|
        next unless symbol?(char)

        used_parts += used_parts(row_index, col_index)
      end
    end
    used_parts
  end

  def gear_ratios
    gear_ratios = 0
    @grid.each_with_index do |row, row_index|
      row.chars.each_with_index do |char, col_index|
        next unless char == '*'

        used_parts = used_parts(row_index, col_index)
        gear_ratios += used_parts.map(&:number).inject(:*) if used_parts.length == 2
      end
    end
    gear_ratios
  end

  def used_parts(row_index, col_index)
    used_parts = Set.new
    coors = neighbor_coordinates(row_index, col_index)
    coors.each do |coor|
      @parts.each do |part|
        used_parts << part if part.here?(col: coor[1], row: coor[0])
      end
    end
    used_parts
  end

  def neighbor_coordinates(row, column)
    [
      [row + 1, column],
      [row - 1, column],
      [row, column + 1],
      [row, column - 1],
      [row + 1, column + 1],
      [row + 1, column - 1],
      [row - 1, column + 1],
      [row - 1, column - 1]
    ].select { |r, c| r >= 0 && c >= 0 }
      .select { |r, c| r < @grid.length && c < @grid[0].length }
  end

  def to_s
    @parts.each do |part|
      puts "#{part.number}: #{part.col}, #{part.row}"
    end
  end

  private

  def symbol?(char)
    !number?(char) && char != '.'
  end

  def number?(char)
    !char.nil? && char.match?(/[[:digit:]]/)
  end
end

class PartNumber
  attr_reader :number, :col, :row

  def initialize(number:, col:, row:)
    @number = number
    @col = col
    @row = row
  end

  def length
    @number.to_s.length
  end

  def end_col
    @col + length
  end

  def here?(col:, row:)
    coors = (@col...@col + length).map do |y|
      [y, @row]
    end

    coors.include?([col, row])
  end
end
