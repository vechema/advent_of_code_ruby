# frozen_string_literal: true

module Year2021
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def least_fuel_cost(fuel_calc:)
      least_fuel_amount = ((2**((0.size * 8) - 2)) - 1)
      least_fuel_position = -1
      (0..data.max).each do |current_position|
        current_fuel_amount = 0
        data.each do |starting_position|
          cost = fuel_calc.call(current_position, starting_position)
          current_fuel_amount += cost
        end
        if current_fuel_amount < least_fuel_amount
          least_fuel_amount = current_fuel_amount
          least_fuel_position = current_position
        end
      end

      least_fuel_amount
    end

    def part_1
      abs_diff = ->(x, y) { (x - y).abs }
      least_fuel_cost(fuel_calc: abs_diff)
    end

    def part_2
      triangular_number = lambda do |x, y|
        n = (x - y).abs
        (n * (n + 1)) / 2
      end
      least_fuel_cost(fuel_calc: triangular_number)
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
