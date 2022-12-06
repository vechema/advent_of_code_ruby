# frozen_string_literal: true

module Year2022
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def start_marker(num_uniq_chars:)
      data.chars.each_cons(num_uniq_chars).with_index do |sequence, index|
        return index + num_uniq_chars if sequence.uniq.count == sequence.count
      end
    end

    def part_1
      start_marker(num_uniq_chars: 4)
    end

    def part_2
      start_marker(num_uniq_chars: 14)
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
