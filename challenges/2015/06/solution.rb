# frozen_string_literal: true

module Year2015
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def follow_instructions(on, off, toggle)
      data.each do |instruction, x_range, y_range|
        case instruction
        when 'on'
          on[x_range, y_range]
        when 'off'
          off[x_range, y_range]
        else
          toggle[x_range, y_range]
        end
      end
    end

    def change_lights(x_range, y_range, new_value)
      x_range.each do |x|
        y_range.each do |y|
          @lights[x][y] = new_value[@lights[x][y]]
        end
      end
    end

    def part_1
      follow_instructions(
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(_) { 1 }) },
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(_) { 0 }) },
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(light) { 1 - light }) }
      )

      @lights.flatten.count { |l| l == 1 }
    end

    def part_2
      follow_instructions(
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(light) { 1 + light }) },
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(light) { [light - 1, 0].max }) },
        ->(x_range, y_range) { change_lights(x_range, y_range, ->(light) { 2 + light }) }
      )

      @lights.flatten.sum
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      @lights = Array.new(1000) { [0] * 1000 }

      line = line.split
      line = line.drop(1) if line.length == 5

      line.delete_at(2)

      start_x, start_y = line[1].split(',').map(&:to_i)
      end_x, end_y = line[2].split(',').map(&:to_i)

      line[1] = (start_x..end_x)
      line[2] = (start_y..end_y)

      line
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
