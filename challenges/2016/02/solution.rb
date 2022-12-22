# frozen_string_literal: true

module Year2016
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def new_position(direction, keypad, pos_x, pos_y)
      new_x = pos_x
      new_y = pos_y
      case direction
      when 'U'
        new_x = [pos_x - 1, 0].max
      when 'D'
        new_x = [pos_x + 1, keypad.length - 1].min
      when 'L'
        new_y = [pos_y - 1, 0].max
      when 'R'
        new_y = [pos_y + 1, keypad.length - 1].min
      end
      x = keypad[new_x][pos_y].nil? ? pos_x : new_x
      y = keypad[pos_x][new_y].nil? ? pos_y : new_y

      [x, y]
    end

    def bathroom_code(keypad, start_x, start_y)
      x = start_x
      y = start_y

      code = ''
      data.each do |directions|
        directions.each do |direction|
          x, y = new_position(direction, keypad, x, y)
        end
        code += keypad[x][y]
      end
      code
    end

    def part_1
      keypad = [
        %w[1 2 3],
        %w[4 5 6],
        %w[7 8 9]
      ]
      bathroom_code(keypad, 1, 1).to_i
    end

    def part_2
      keypad = [
        [nil, nil, '1', nil, nil],
        [nil, '2', '3', '4', nil],
        %w[5 6 7 8 9],
        [nil, 'A', 'B', 'C', nil],
        [nil, nil, 'D', nil, nil]
      ]
      bathroom_code(keypad, 2, 0)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.chars
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
