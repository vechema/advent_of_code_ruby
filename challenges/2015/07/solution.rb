# frozen_string_literal: true

module Year2015
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def run_binary_instruction(operation, signals, wire)
      wire1, op, wire2 = operation

      one = signals[wire1] || wire1.to_i
      two = signals[wire2] || wire2.to_i

      case op
      when 'AND'
        signals[wire] = one & two
      when 'OR'
        signals[wire] = one | two
      when 'LSHIFT'
        signals[wire] = signals[wire1] << two
      when 'RSHIFT'
        signals[wire] = signals[wire1] >> two
      end
    end

    def run_instruction(instruction, signals)
      operation, wire = instruction
      case operation.count
      when 1 # Assignment
        amount = operation[0]

        one = signals[amount]
        one ||= amount.to_i
        signals[wire] = one
      when 2 # NOT
        signals[wire] = ((2**16) - 1) ^ signals[operation[1]]
      else # AND, OR, LSHIFT, RSHIFT
        run_binary_instruction(operation, signals, wire)
      end
    end

    def skip_instruction?(instruction, signals)
      operation, wire = instruction
      return true if signals[wire]

      operations = %w[NOT AND OR LSHIFT RSHIFT]

      return false if operation.all? do |op|
        next true if operations.include?(op)

        !signals[op].nil? || op.to_i.to_s == op
      end

      true
    end

    def run_instructions(signals)
      instructions_left = data.dup
      instructions_left_count = instructions_left.count
      previous_instructions_left_count = instructions_left_count
      loop do
        instructions_to_delete = []
        instructions_left.each_with_index do |instruction, index|
          next if skip_instruction?(instruction, signals)

          instructions_to_delete << index

          run_instruction(instruction, signals)
        end

        instructions_to_delete.reverse.each { |index| instructions_left.delete_at(index) }

        previous_instructions_left_count = instructions_left_count
        instructions_left_count = instructions_left.count

        break if (previous_instructions_left_count - instructions_left_count).zero?
      end
    end

    def part_1
      signals = {}

      run_instructions(signals)

      signals['a']
    end

    def part_2
      signals = {}

      run_instructions(signals)

      signals2 = { 'b' => signals['a'] }

      run_instructions(signals2)

      signals2['a']
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split(' -> ')
      line[0] = line[0].split
      line
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
