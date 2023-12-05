# frozen_string_literal: true

module Year2021
  class Day11 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      OctopusMap.new(rows: data).steps(num_steps: 100)
    end

    def part_2
      OctopusMap.new(rows: data).steps_until_max_flash
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

class NumberGrid
  def initialize(rows:)
    @grid = rows.map do |row|
      row.chars.map(&:to_i)
    end
  end

  def orthogonal_neighbor_coordinates(row:, column:)
    in_grid_coordinates(
      all_coordinates: [
        [row + 1, column],
        [row - 1, column],
        [row, column + 1],
        [row, column - 1]
      ]
    )
  end

  def diagonal_neighbor_coordinates(row:, column:)
    in_grid_coordinates(
      all_coordinates: [
        [row + 1, column + 1],
        [row + 1, column - 1],
        [row - 1, column + 1],
        [row - 1, column - 1]
      ]
    )
  end

  def all_neighbor_coordinates(row:, column:)
    orthogonal_neighbor_coordinates(row: row, column: column) +
      diagonal_neighbor_coordinates(row: row, column: column)
  end

  def orthogonal_neighbors(row:, column:)
    orthogonal_neighbor_coordinates(row: row, column: column).map { |x, y| @grid[x][y] }
  end

  private

  def in_grid_coordinates(all_coordinates:)
    all_coordinates.select { |r, c| r >= 0 && c >= 0 }
                   .select { |r, c| r < @grid.length && c < @grid[0].length }
  end
end

class OctopusMap < NumberGrid
  def steps(num_steps:)
    total_flashes = 0
    num_steps.times do
      total_flashes += step
    end
    total_flashes
  end

  def steps_until_max_flash
    num_flashes = step
    num_steps = 1
    while num_flashes < @grid.count * @grid[0].count
      num_flashes = step
      num_steps += 1
    end
    num_steps
  end

  def step
    num_flashes = cascade_flashes(starting_octo_coordinates: increase_all_energy)

    reset_flashed_octos

    num_flashes
  end

  private

  def increase_all_energy
    flashing_octo_coordinates = []
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |_value, column_index|
        @grid[row_index][column_index] += 1
        flashing_octo_coordinates << [row_index, column_index] if @grid[row_index][column_index] > 9
      end
    end
    flashing_octo_coordinates
  end

  def cascade_flashes(starting_octo_coordinates:)
    num_flashes = 0
    flashing_octo_coordinates = starting_octo_coordinates.clone
    to_explore_coordinates = flashing_octo_coordinates.clone
    until to_explore_coordinates.empty?
      current_octo = to_explore_coordinates.shift
      neighbor_coordinates = all_neighbor_coordinates(row: current_octo[0], column: current_octo[1])
      increase_neighbor_energy(neighbor_coordinates: neighbor_coordinates)
      num_flashes += 1

      neighbor_coordinates.each do |neighbor_coordinate|
        if flashing_octo_coordinates.include?(neighbor_coordinate) ||
           @grid[neighbor_coordinate[0]][neighbor_coordinate[1]] <= 9
          next
        end

        to_explore_coordinates << neighbor_coordinate
        flashing_octo_coordinates << neighbor_coordinate
      end
    end

    num_flashes
  end

  def increase_neighbor_energy(neighbor_coordinates:)
    neighbor_coordinates.each do |row, column|
      @grid[row][column] += 1
    end
  end

  def reset_flashed_octos
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |_value, column_index|
        @grid[row_index][column_index] = 0 if @grid[row_index][column_index] > 9
      end
    end
  end
end
