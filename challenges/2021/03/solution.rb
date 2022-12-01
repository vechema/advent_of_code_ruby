# frozen_string_literal: true
module Year2021
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def tally(index:, input: data)
      input.map { |x| x[index] }.tally
    end

    def rate(select_by:)
      block = proc { |_, v| v }
      (0...data[0].length).map do |index|
        tally(index: index).method(select_by).call(&block)[0]
      end.join.to_i(2)
    end

    def part_1
      rate(select_by: :max_by) * rate(select_by: :min_by)
    end

    def rating(select_by:, tie_breaker:)
      rating = ''
      block = proc { |_, v| v }
      (0...data[0].length).each do |index|
        tally = tally(index: index, input: data.select { |i| i.start_with?(rating) })
        rating += if tally['0'] == tally['1']
                    tie_breaker
                  else
                    tally.method(select_by).call(&block)[0]
                  end
      end
      rating.to_i(2)
    end

    def part_2
      rating(select_by: :max_by, tie_breaker: '1') * rating(select_by: :min_by, tie_breaker: '0')
    end

    private
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
