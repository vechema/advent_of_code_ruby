# frozen_string_literal: true

module Year2016
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def valid_triangle?(side1, side2, side3)
      side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
    end

    def part_1
      data.count do |triangle|
        side1, side2, side3 = triangle
        valid_triangle?(side1, side2, side3)
      end
    end

    def part_2
      data.each_slice(3).sum do |triangles|
        one_side1, two_side1, three_side1 = triangles[0]
        one_side2, two_side2, three_side2 = triangles[1]
        one_side3, two_side3, three_side3 = triangles[2]

        [
          valid_triangle?(one_side1, one_side2, one_side3),
          valid_triangle?(two_side1, two_side2, two_side3),
          valid_triangle?(three_side1, three_side2, three_side3)
        ].count(true)
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split.map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
