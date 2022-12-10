# frozen_string_literal: true

module Year2015
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def santa_pasts(num_santas)
      santas = Array.new(num_santas) { [0, 0] }
      pasts = []
      data.chars.each_slice(num_santas) do |dirs|
        dirs.each_with_index do |dir, index|
          case dir
          when '>'
            santas[index][0] += 1
          when '<'
            santas[index][0] -= 1
          when '^'
            santas[index][1] += 1
          when 'v'
            santas[index][1] -= 1
          end

          pasts << santas[index].dup
        end
      end

      pasts.uniq.count
    end

    def part_1
      santa_pasts(1)
    end

    def part_2
      santa_pasts(2)
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
