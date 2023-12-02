# frozen_string_literal: true

module Year2023
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |line|
        first = line.scan(/\d+/).first[0]
        last = line.scan(/\d+/).last[-1]

        (first + last).to_i
      end
    end

    NUM_HASH = {
      '1' => 1,
      'one' => 1,
      '2' => 2,
      'two' => 2,
      '3' => 3,
      'three' => 3,
      '4' => 4,
      'four' => 4,
      '5' => 5,
      'five' => 5,
      '6' => 6,
      'six' => 6,
      '7' => 7,
      'seven' => 7,
      '8' => 8,
      'eight' => 8,
      '9' => 9,
      'nine' => 9
    }.freeze

    def part_2
      data.sum do |line|
        first = first_or_last_number(line)

        last = first_or_last_number(line, is_first: false)

        (first * 10) + last
      end
    end

    private

    def first_or_last_number(line, is_first: true)
      index_to_num = NUM_HASH.keys
                             .to_h { |y| [y, is_first ? line.index(y) : line.rindex(y)] }
                             .compact.invert
      num = if is_first
              index_to_num.min[1]
            else
              index_to_num.max[1]
            end

      NUM_HASH[num]
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
