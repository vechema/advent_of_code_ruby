# frozen_string_literal: true

module Year2022
  class Day14 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def place_sand(sand_pos_x, sand_pos_y, cave)
      while sand_pos_x < cave.size && sand_pos_y < cave[0].size
        if cave[sand_pos_x][sand_pos_y + 1] == '.'
          sand_pos_y += 1
        elsif cave[sand_pos_x - 1][sand_pos_y + 1] == '.'
          sand_pos_x -= 1
          sand_pos_y += 1
        elsif cave[sand_pos_x + 1][sand_pos_y + 1] == '.'
          sand_pos_x += 1
          sand_pos_y += 1
        else
          break
        end
      end

      [sand_pos_x, sand_pos_y]
    end

    def sand_simulation(cave)
      count = 0
      while count < 100_000
        sand_pos_x = 500
        sand_pos_y = 0

        sand_pos_x, sand_pos_y = place_sand(sand_pos_x, sand_pos_y, cave)

        break unless sand_pos_x < cave.size - 1 && sand_pos_y < cave[0].size - 1

        count += 1
        cave[sand_pos_x][sand_pos_y] = 'o'

        break if sand_pos_x == 500 && sand_pos_y.zero?
      end

      count
    end

    def maxes
      max_x = 0
      max_y = 0
      data.flatten.each do |rock_line|
        rock_line.all_coordinates.each do |rock|
          x, y = rock

          max_x = x if x > max_x
          max_y = y if y > max_y
        end
      end

      [max_x, max_y]
    end

    def cave(floor:)
      max_x, max_y = maxes

      data << VentLine.new(x1: 0, y1: max_y + 2, x2: max_x + max_y, y2: max_y + 2) if floor

      cave = Array.new(max_x + max_y + 1) { '.' * (max_y + 4) }
      data.flatten.each do |rock_line|
        rock_line.all_coordinates.each do |rock|
          x, y = rock

          cave[x][y] = '#'
        end
      end

      cave
    end

    def part_1
      sand_simulation(cave(floor: false))
    end

    def part_2
      sand_simulation(cave(floor: true))
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split(' -> ').map { |x| x.split(',').map(&:to_i) }

      line.each_cons(2).map do |pair|
        x1, y1 = pair[0]
        x2, y2 = pair[1]
        VentLine.new(x1: x1, y1: y1, x2: x2, y2: y2)
      end
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
