# frozen_string_literal: true

module Year2022
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.count do |pair|
        elf1_section1, elf1_section2, elf2_section1, elf2_section2 = pair

        elf1_full_contains = elf1_section1 <= elf2_section1 &&
                             elf1_section2 >= elf2_section2

        elf2_full_contains = elf2_section1 <= elf1_section1 &&
                             elf2_section2 >= elf1_section2

        elf1_full_contains || elf2_full_contains
      end
    end

    def part_2
      data.count do |pair|
        elf1_section1, elf1_section2, elf2_section1, elf2_section2 = pair

        elf1_range = elf2_section1..elf2_section2
        low_overlap1 = elf1_range.cover?(elf1_section1)
        high_overlap1 = elf1_range.cover?(elf1_section2)

        elf2_range = elf1_section1..elf1_section2
        low_overlap2 = elf2_range.cover?(elf2_section1)
        high_overlap2 = elf2_range.cover?(elf2_section2)

        low_overlap1 || high_overlap1 || low_overlap2 || high_overlap2
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(Regexp.union([',', '-'])).map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
