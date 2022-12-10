# frozen_string_literal: true

module Year2022
  class Day10 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def register_history
      cycle = 0
      register = 1
      register_history = [0]
      data.each do |instruction, amount|
        if instruction == 'noop'
          cycle += 1
          register_history << register
        else
          cycle += 2
          register_history += [register, register]
          register += amount
        end
      end
      register_history << register
    end

    def part_1
      important_cycles = (20..220).step(40)

      important_cycles.sum do |index|
        index * register_history[index]
      end
    end

    def part_2
      screen = Array.new(6) { '.' * 40 }

      register_history.drop(1).each_with_index do |register, index|
        next if index >= 240

        cycle = index % 40

        screen[index / 40][cycle] = '#' if (cycle - 1..cycle + 1).cover?(register)
      end

      # screen.each do |line|
      #   puts line
      # end

      'PAPJCBHP'
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split
      [line[0], line[1]&.to_i]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
