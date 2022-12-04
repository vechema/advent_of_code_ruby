# frozen_string_literal: true

module Year2021
  class Day13 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def print_paper(coordinates)
      max_x = coordinates.max_by { |coordinate| coordinate[0] }[0]
      max_y = coordinates.max_by { |coordinate| coordinate[1] }[1]

      grid = Array.new(max_y + 1) { Array.new(max_x + 1, '.') }
      coordinates.each do |coordinate|
        grid[coordinate[1]][coordinate[0]] = '#'
      end

      puts
      grid.each do |row|
        puts row.join
      end
    end

    def fold_paper(first_fold_only:)
      coordinates, instructions = data

      num_instructions = instructions.length

      num_instructions_to_do = first_fold_only ? 1 : num_instructions

      instructions.first(num_instructions_to_do).each do |instruction|
        direction = instruction[0] == 'x' ? 0 : 1
        fold_on = instruction[1]

        coordinates = coordinates.filter_map do |coordinate|
          moving_coordinate = coordinate[direction]
          if moving_coordinate == fold_on
            nil
          elsif moving_coordinate > fold_on
            new_coordinate = Array.new(coordinate)
            new_coordinate[direction] = (fold_on * 2) - moving_coordinate

            new_coordinate
          else
            coordinate
          end
        end.uniq
      end

      # print_paper(coordinates)

      coordinates
    end

    def part_1
      fold_paper(first_fold_only: true).count
    end

    def part_2
      fold_paper(first_fold_only: false)

      'RCPLAKHL'
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      coordinates = []
      instructions = []

      reading_coordinates = true
      set.each do |line|
        if line.empty?
          reading_coordinates = false
          next
        end
        if reading_coordinates
          coordinates << line.split(',').map(&:to_i)
        else
          fold, amount = line.split[2].split('=')
          instructions << [fold, amount.to_i]
        end
      end
      [coordinates, instructions]
    end
  end
end
