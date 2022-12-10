# frozen_string_literal: true

module Year2015
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |x, y, z|
        top = x * y
        side = x * z
        heel = y * z

        (2 * (top + side + heel)) + [top, side, heel].min
      end
    end

    def part_2
      data.sum do |x, y, z|
        l1, l2 = [x, y, z].min(2)

        (2 * (l1 + l2)) + (x * y * z)
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split('x').map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
