# frozen_string_literal: true

require 'digest'

module Year2015
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def md5_num_zeros(num_zeros)
      x = 0
      while x

        return x if Digest::MD5.hexdigest("#{data}#{x}").start_with?('0' * num_zeros)

        x += 1

        return if x > 10_000_000
      end
    end

    def part_1
      md5_num_zeros(5)
    end

    def part_2
      md5_num_zeros(6)
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
