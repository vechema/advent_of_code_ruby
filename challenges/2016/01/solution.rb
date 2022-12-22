# frozen_string_literal: true

module Year2016
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def walk_directions
      x = 0
      y = 0
      locations = [[0, 0]]
      directions = %w[N E S W]
      current_direction = 0
      data.each do |movement|
        turn, amount = movement
        current_direction = if turn == 'R'
                              (current_direction + 1) % 4
                            else
                              (current_direction - 1) % 4
                            end

        case directions[current_direction]
        when 'N'
          y += amount
        when 'S'
          y -= amount
        when 'E'
          x += amount
        when 'W'
          x -= amount
        end
        locations << [x, y]
      end
      locations
    end

    def part_1
      locations = walk_directions

      x, y = locations.last
      x.abs + y.abs
    end

    def range(one, two)
      if one > two
        one.downto(two + 1)
      else
        (one..two - 1)
      end
    end

    def part_2
      locations = walk_directions
      all_locations = locations.each_cons(2).flat_map do |points|
        point1, point2 = points
        x1, y1 = point1
        x2, y2 = point2

        if x1 == x2
          range(y1, y2).map do |y|
            [x1, y]
          end
        else
          range(x1, x2).map do |x|
            [x, y1]
          end
        end
      end

      x, y = all_locations.find do |location|
        all_locations.count(location) > 1
      end

      x.abs + y.abs
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(', ').map do |movement|
        [movement[0], movement[1..].to_i]
      end
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
