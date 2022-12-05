# frozen_string_literal: true

module Year2022
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def move_crates(pop_all_at_once:)
      crate_placement, instructions = data

      instructions.each do |instruction|
        times = instruction[0]
        from = instruction[1]
        to = instruction[2]
        if pop_all_at_once
          crate = crate_placement[from].pop(times)
          crate_placement[to] += crate
        else
          times.times do
            crate = crate_placement[from].pop
            crate_placement[to] << crate
          end
        end
      end

      crate_placement.map(&:last).join
    end

    def part_1
      move_crates(pop_all_at_once: false)
    end

    def part_2
      move_crates(pop_all_at_once: true)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      crate_placement = Array.new(9) { [] }
      instructions = []

      reading_crates = true
      set.each do |line|
        if line.empty?
          reading_crates = false
          next
        end

        if reading_crates
          insert_into_crate_placement(line: line, crate_placement: crate_placement)
        else
          words = line.split
          instructions << [words[1].to_i, words[3].to_i - 1, words[5].to_i - 1]
        end
      end

      [crate_placement, instructions]
    end

    def insert_into_crate_placement(line:, crate_placement:)
      line.chars.each_with_index do |char, index|
        if char.match?(/[[:alpha:]]/)
          real_index = (index - 1) / 4
          crate_placement[real_index].unshift(char)
        end
      end
    end
  end
end
