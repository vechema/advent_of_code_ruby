# frozen_string_literal: true

module Year2021
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def fish_sim(days:)
      fishes = data.tally
      days.times do
        new_fishes = Hash.new(0)
        fishes.each do |timer, count|
          if timer.zero?
            new_fishes[6] += count
            new_fishes[8] += fishes[0]
          else
            new_fishes[timer - 1] += count
          end
        end
        fishes = new_fishes
      end
      fishes.sum { |_, v| v }
    end

    def part_1
      fish_sim(days: 80)
    end

    def part_2
      fish_sim(days: 256)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(',').map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
