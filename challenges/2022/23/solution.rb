# frozen_string_literal: true

module Year2022
  class Day23 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.each do |row|
        puts row
      end

      puts 'And go'
      puts
      puts

      # do 10 times
      # Make new parameter if there's an elf on the edge
      # left & right first - add '.' to end or beginning
      # then top or bottom - add row of '.' at beginning or end
      # Iterate through each elf & do the simulation

      north = ->(x, y) { [data[x - 1][y - 1], data[x - 1][y], data[x - 1][y + 1], [x - 1, y]] }
      south = ->(x, y) { [data[x + 1][y - 1], data[x + 1][y], data[x + 1][y + 1], [x + 1, y]] }
      east = ->(x, y) { [data[x - 1][y + 1], data[x][y + 1], data[x + 1][y + 1], [x, y + 1]] }
      west = ->(x, y) { [data[x - 1][y - 1], data[x][y - 1], data[x + 1][y - 1], [x, y - 1]] }

      directions = [north, south, east, west]
      first_direction = 0

      10.times do
        # START expand grid
        height = data.size

        left = (0..height - 1).any? do |r_index|
          data[r_index][0] == '#'
        end

        if left
          (0..height - 1).each do |r_index|
            data[r_index].prepend('.')
          end
        end

        width = data[0].size

        right = (0..height - 1).any? do |r_index|
          data[r_index][width - 1] == '#'
        end

        if right
          (0..height - 1).each do |r_index|
            data[r_index] << '.'
          end
        end

        width = data[0].size

        data << ('.' * width) if data[height - 1].include?('#')

        data.unshift('.' * width) if data[0].include?('#')

        # END expand grid

        # START elf proposal

        elf_moves = {}

        data.each_with_index do |row, r_index|
          row.chars.each_with_index do |spot, c_index|
            next unless spot == '#'

            # puts "Spot: #{spot} #{r_index} #{c_index}"

            all_clear = directions.all? do |direction|
              direction[r_index, c_index].count { |s| s == '.' } == 3
            end

            next if all_clear

            directions.count.times do |dir_index|
              direction = directions[(first_direction + dir_index) % directions.count]
              # puts "Direction: #{direction[r_index,
              #                              c_index]}, index: #{(first_direction + dir_index - 1) % directions.count}"
              if direction[r_index, c_index].count { |s| s == '.' } == 3
                elf_moves[[r_index, c_index]] = direction[r_index, c_index].last
                break
              end
            end
          end
        end

        first_direction += 1

        # Remove proposals w/ the same value

        elf_moves = elf_moves.reject do |_k, v|
          elf_moves.values.count(v) > 1
        end

        # END elf proposal

        # Move them elves
        elf_moves.each do |old_spot, new_spot|
          data[old_spot[0]][old_spot[1]] = '.'
          data[new_spot[0]][new_spot[1]] = '#'
        end

        data.each do |row|
          puts row
        end

        puts
        puts
      end
      nil
    end

    def part_2
      nil
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
