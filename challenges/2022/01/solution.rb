# frozen_string_literal: true
module Year2022
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def max_calories(window_size: 1)
      max_calories = Array.new(window_size, 0)
      current_calories = 0
      data.each do |calories|
        current_calories += calories
        if calories == 0
          if current_calories > max_calories.min
            min_index = max_calories.find_index(max_calories.min)
            max_calories[min_index] = current_calories
          end
          current_calories = 0
        end
      end

      max_calories.sum
    end

    def part_1
      max_calories(window_size: 1)
    end

    def part_2
      max_calories(window_size: 3)
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
