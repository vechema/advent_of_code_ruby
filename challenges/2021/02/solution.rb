# frozen_string_literal: true

module Year2021
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      total_movement = {}
      data.each do |direction, distance|
        if total_movement[direction]
          total_movement[direction] += distance
        else
          total_movement[direction] = distance
        end
      end

      (total_movement['down'] - total_movement['up']) * total_movement['forward']
    end

    def part_2
      aim = 0
      depth = 0
      position = 0

      data.each do |direction, distance|
        case direction
        when 'forward'
          position += distance
          depth += aim * distance
        when 'up'
          aim -= distance
        when 'down'
          aim += distance
        end
      end

      depth * position
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      [line.split[0], line.split[1].to_i]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
