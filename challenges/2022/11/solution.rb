# frozen_string_literal: true

module Year2022
  class Day11 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    # Tried taking the inner most loop stuff out into a Monkey method
    #  But then had to pass data & worry_reduction
    #   AND it was less readable and still failed rubocop
    # rubocop:disable Metrics/AbcSize
    def monkey_simulation(rounds, worry_reduction)
      lcm = data.map(&:condition).inject(:*)

      rounds.times do
        data.each do |monkey|
          monkey.num_inspected += monkey.items.count
          monkey.items.each do |item|
            new_item = monkey.operation[item] / worry_reduction
            index = (new_item % monkey.condition).zero? ? monkey.condition_true : monkey.condition_false

            data[index].items << (new_item % lcm)
          end

          monkey.items = []
          # monkey.go_through_items(data, worry_reduction)
        end
      end

      data.map(&:num_inspected).max(2).inject(:*)
    end
    # rubocop:enable Metrics/AbcSize

    def part_1
      monkey_simulation(20, 3)
    end

    def part_2
      monkey_simulation(10_000, 1)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    def parse_items(line)
      line.split(':')[1].split(',').map(&:to_i)
    end

    # Processes the dataset as a whole
    # Was 8/7
    # rubocop:disable Metrics/CyclomaticComplexity
    def process_dataset(set)
      monkeys = []
      monkey = Monkey.new
      set.each_with_index do |line, index|
        last_int = line.split.last.to_i

        case index % 7
        when 1
          monkey.items = parse_items(line)
        when 2
          monkey.operation_from_string(line)
        when 3
          monkey.condition = last_int
        when 4
          monkey.condition_true = last_int
        when 5
          monkey.condition_false = last_int
        when 6
          monkeys << monkey
          monkey = Monkey.new
        end
      end

      monkeys << monkey

      monkeys
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end
end

class Monkey
  attr_accessor :items, :operation, :condition, :condition_true, :condition_false, :num_inspected

  def initialize
    @num_inspected = 0
  end

  def condition_from_string(str)
    monkey.condition = str.split.last.to_i
  end

  def operation_from_string(str)
    raw_operation = str.split(' = ').last
    self.operation =
      if raw_operation == 'old * old'
        ->(old) { old * old }
      elsif raw_operation.start_with?('old *')
        ->(old) { old * raw_operation.split.last.to_i }
      else
        ->(old) { old + raw_operation.split.last.to_i }
      end
  end
end
