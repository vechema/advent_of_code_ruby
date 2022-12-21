# frozen_string_literal: true

module Year2022
  class Day21 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def operation_lambdas(operation, index)
      multiply = [->(x, y) { x * y }, ->(x, y) { x / y }]
      add = [->(x, y) { x + y }, ->(x, y) { x - y }]
      case operation
      when '*'
        multiply[index]
      when '/'
        multiply.reverse[index]
      when '+'
        add[index]
      when '-'
        add.reverse[index]
      end
    end

    def math(monkey, numbers)
      base, monkey1, operation, monkey2 = monkey

      monkey1_num = numbers[monkey1]
      monkey2_num = numbers[monkey2]
      base_num = numbers[base]

      if monkey1_num && monkey2_num
        numbers[base] = operation_lambdas(operation, 0)[monkey1_num, monkey2_num]
      elsif base_num && monkey2_num
        numbers[monkey1] = operation_lambdas(operation, 1)[base_num, monkey2_num]
      elsif ['*', '+'].include?(operation)
        numbers[monkey2] = operation_lambdas(operation, 1)[base_num, monkey1_num]
      else
        numbers[monkey2] = operation_lambdas(operation, 0)[monkey1_num, base_num]
      end
    end

    def run_monkey(monkey, numbers)
      base, monkey1, operation, monkey2 = monkey

      case operation
      when '='
        number = numbers[monkey1]
        number ||= numbers[monkey2]

        numbers[monkey1] ||= number
        numbers[monkey2] ||= number
      when '*', '+', '/', '-'
        math(monkey, numbers)
      else
        numbers[base] = monkey1.to_i if monkey1.to_i.to_s == monkey1
      end
    end

    def skip_monkey?(monkey, numbers)
      base, monkey1, operation, monkey2 = monkey

      missing = [numbers[monkey1].nil?, numbers[monkey2].nil?, numbers[base].nil? && operation != '='].count(true)

      if operation.nil?
        return true if numbers[base]
      elsif missing >= 2
        return true
      end

      false
    end

    def simulate_monkeys(monkeys, numbers)
      monkeys_left = monkeys.dup
      monkeys_left_count = monkeys_left.count
      previous_monkeys_left_count = monkeys_left_count
      loop do
        monkeys_to_delete = []
        monkeys_left.each_with_index do |monkey, index|
          next if skip_monkey?(monkey, numbers)

          monkeys_to_delete << index

          run_monkey(monkey, numbers)
        end

        monkeys_to_delete.reverse.each { |index| monkeys_left.delete_at(index) }

        previous_monkeys_left_count = monkeys_left_count
        monkeys_left_count = monkeys_left.count

        break if (previous_monkeys_left_count - monkeys_left_count).zero?
      end
    end

    def part_1
      numbers = {}
      simulate_monkeys(data, numbers)
      numbers['root']
    end

    def part_2
      modified_monkeys = data.map do |monkey_info|
        base, monkey1, _, monkey2 = monkey_info
        case base
        when 'root'
          [base, monkey1, '=', monkey2]
        when 'humn'
          [base, 'answer']
        else
          monkey_info
        end
      end

      numbers = {}
      simulate_monkeys(modified_monkeys, numbers)

      numbers['humn']
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split
      line[0] = line[0].delete(':')
      line
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
