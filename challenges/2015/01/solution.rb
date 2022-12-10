# frozen_string_literal: true

module Year2015
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      tally = data.chars.tally
      tally['('] - tally[')']
    end

    def part_2
      floor = 0
      data.chars.each_with_index do |instruction, index|
        if instruction == '('
          floor += 1
        else
          floor -= 1
        end
        return index + 1 if floor == -1
      end
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
