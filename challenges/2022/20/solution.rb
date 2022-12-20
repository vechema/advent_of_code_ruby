# frozen_string_literal: true

module Year2022
  class Day20 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def score(mixed_numbers)
      array = []
      mixed_numbers.each do |thing|
        n, i = thing
        array[i] = n
      end

      index_of_zero = array.index(0)

      length = array.count

      one_thousandth = array[(1000 + index_of_zero) % length]
      two_thousandth = array[(2000 + index_of_zero) % length]
      three_thousandth = array[(3000 + index_of_zero) % length]

      [one_thousandth, two_thousandth, three_thousandth].sum
    end

    def move_other_numbers(original_numbers, old_index, new_index)
      if (old_index - new_index).negative?
        range = (old_index + 1..new_index)
        operation = ->(x) { x - 1 }
      else
        range = (new_index..old_index - 1)
        operation = ->(x) { x + 1 }
      end

      original_numbers.each_with_index do |item, ind|
        number, i = item
        next unless range.cover?(i)

        original_numbers[ind] = [number, operation[i]]
      end
    end

    def mix(numbers, multiplication_factor, times)
      original = numbers.each_with_index.map do |num, index|
        [num * multiplication_factor, index]
      end
      length = original.count

      times.times do
        original.each_with_index do |element, original_index|
          num, index = element

          next if num.zero?

          new_index = (index + num) % (length - 1)

          move_other_numbers(original, index, new_index)

          original[original_index] = [num, new_index]
        end
      end

      score(original)
    end

    def part_1
      mix(data, 1, 1)
    end

    def part_2
      mix(data, 811_589_153, 10)
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
