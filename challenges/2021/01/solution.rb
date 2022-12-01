# frozen_string_literal: true
module Year2021
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def num_increases(array:)
      array.each_with_index.count do |x, index|
        x > array[[0,index - 1].max]
      end
    end

    def part_1
      num_increases(array: data)
    end

    def part_2
      sliding_window_sum = data.each_cons(3).map(&:sum)
      num_increases(array: sliding_window_sum)
    end

    private
      # Processes each line of the input file and stores the result in the dataset
      def process_input(line)
        line.to_i
      end

      # Processes the dataset as a whole
      # def process_dataset(set)
      #   set
      # end
  end
end
