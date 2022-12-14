# frozen_string_literal: true

require 'json'

module Year2022
  class Day13 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def compare(left, right)
      return false if right.nil?

      if left.is_a?(Numeric) && right.is_a?(Array)
        left = [left]
      elsif left.is_a?(Array) && right.is_a?(Numeric)
        right = [right]
      end

      if left.is_a?(Numeric)
        return false if right.nil?
        return true if left < right
        return false if right < left
      else
        left.each_with_index do |l, index|
          x = compare(l, right[index])

          return x unless x.nil?
        end

        return true if left.count < right.count
      end

      nil
    end

    def part_1
      data.each_slice(3).with_index.sum do |pair, index|
        left, right = pair
        next index + 1 if compare(left, right)

        0
      end
    end

    def part_2
      dividers = [[[2]], [[6]]]
      packets = (data + dividers).compact
      packets.sort! { |left, right| compare(left, right) ? -1 : 1 }
      dividers.map { |divider| packets.index(divider) + 1 }.inject(:*)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      return JSON.parse(line) unless line.empty?

      nil
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set.each_slice(3).map do |lines|
    #     [JSON.parse(lines[0]), JSON.parse(lines[1])]
    #   end
    # end
  end
end
