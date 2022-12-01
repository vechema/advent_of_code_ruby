# frozen_string_literal: true

module Year2021
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/PerceivedComplexity
    def play_bingo(player_win: true)
      indices_of_winning_boards = []
      # Must draw at least 4 numbers to find a winner
      (4...@all_drawn_numbers.size).each do |last_drawn_index|
        drawn_numbers = @all_drawn_numbers[0..last_drawn_index]

        @boards.each_with_index do |board, board_index|
          next if indices_of_winning_boards.include?(board_index)

          drawn_coordinates = []
          nondrawn_numbers = []
          board.each_with_index do |row, row_index|
            row.each_with_index do |value, column_index|
              if drawn_numbers.include?(value)
                drawn_coordinates << [row_index, column_index]
              else
                nondrawn_numbers << value
              end
            end
          end

          bingo_row = drawn_coordinates.map { |x| x[0] }.tally.value?(5)
          bingo_column = drawn_coordinates.map { |x| x[1] }.tally.value?(5)

          next unless bingo_row || bingo_column

          if player_win || indices_of_winning_boards.count == @boards.count - 1
            return nondrawn_numbers.sum * drawn_numbers.last
          end

          indices_of_winning_boards << board_index
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/PerceivedComplexity

    def part_1
      @all_drawn_numbers, @boards = data

      play_bingo(player_win: true)
    end

    def part_2
      @all_drawn_numbers, @boards = data

      play_bingo(player_win: false)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      all_drawn_numbers = set[0].split(',').map(&:to_i)

      board_row = 1
      boards = []
      current_board = []
      set[2..].each do |line|
        next if line.empty?

        current_board << line.split.map(&:to_i)
        if board_row == 5
          board_row = 0
          boards << current_board
          current_board = []
        end
        board_row += 1
      end

      [all_drawn_numbers, boards]
    end
  end
end
