# frozen_string_literal: true

module Year2022
  class Day07 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def file_system
      current_depth = []
      previous_depth = []
      file_system = current_depth
      data.each do |entry|
        if entry == '$ cd ..'
          current_depth = previous_depth.pop
        elsif entry.start_with?('$ cd')
          temp_depth = []
          current_depth << temp_depth
          previous_depth << current_depth
          current_depth = temp_depth
        elsif !entry.start_with?('dir')
          current_depth << entry.split[0].to_i
        end
      end

      file_system
    end

    def dir_size(file_sizes:, sum_sizes:)
      sum_sizes << file_sizes.flatten.sum
      file_sizes.each do |entry|
        dir_size(file_sizes: entry, sum_sizes: sum_sizes) if entry.is_a?(Array)
      end
    end

    def sum_sizes
      sum_sizes = []
      dir_size(file_sizes: file_system, sum_sizes: sum_sizes)
      sum_sizes
    end

    def part_1
      sum_sizes.select { |x| x < 100_000 }.sum
    end

    def part_2
      total = 70_000_000
      smallest_gap = total
      file_size_to_delete = 0
      amount_needed = 30_000_000 - (total - file_system.flatten.sum)

      sum_sizes.each do |sum_size|
        gap = sum_size - amount_needed
        if gap.positive? && gap < smallest_gap
          smallest_gap = gap
          file_size_to_delete = sum_size
        end
      end
      file_size_to_delete
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
