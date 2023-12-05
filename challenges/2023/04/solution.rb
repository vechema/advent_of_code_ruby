# frozen_string_literal: true

module Year2023
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def num_wins
      data.map do |card|
        winners = card[0]
        my_nums = card[1]

        winners.sum do |winner|
          my_nums.count(winner)
        end
      end
    end

    def part_1
      num_wins.sum do |num_win|
        next 2**(num_win - 1) if num_win.positive?

        0
      end
    end

    def part_2
      copies = Array.new(num_wins.length, 1)

      num_wins.each_with_index.sum do |num_win, index|
        num_win.times do |win_index|
          copies[index + 1 + win_index] += copies[index]
        end
      end

      copies.sum
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(':')[1].split('|').map { |nums| nums.split.map(&:to_i) }
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
