# frozen_string_literal: true

module Year2015
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |line|
        index = 1
        code_chars_count = 0
        while index < line.length - 1

          index += if line[index..index + 1] == '\\x'
                     4
                   elsif line[index] == '\\'
                     2
                   else
                     1
                   end
          code_chars_count += 1

        end

        line.length - code_chars_count
      end
    end

    def part_2
      data.sum do |line|
        encoded_line = line.gsub('\\', '\\\\\\')
        encoded_line = encoded_line.gsub('"', '\"')
        encoded_line.length + 2 - line.length
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
