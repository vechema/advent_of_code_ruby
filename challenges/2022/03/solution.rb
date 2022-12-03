# frozen_string_literal: true

module Year2022
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def priority(ascii)
      if ascii >= 97
        ascii - 96
      else
        ascii - 38
      end
    end

    def common_item(items)
      common_item = items[0].chars
      items.drop(1).each do |item|
        common_item &= item.chars
      end

      common_item[0]
    end

    def part_1
      data.sum do |rucksack|
        half = rucksack.length / 2
        priority(common_item([rucksack[0..half - 1], rucksack[half..]]).ord)
      end
    end

    def part_2
      data.each_slice(3).sum do |group|
        priority(common_item(group).ord)
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
