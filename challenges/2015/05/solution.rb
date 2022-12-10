# frozen_string_literal: true

module Year2015
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def three_vowels(word)
      char_tally = word.chars.tally

      (char_tally['a'].to_i +
         char_tally['e'].to_i +
         char_tally['i'].to_i +
         char_tally['o'].to_i +
         char_tally['u'].to_i) >= 3
    end

    def part_1
      data.count do |word|
        combos = word.chars.each_cons(2).map(&:join)
        good_combo = combos.any? { |combo| combo[0] == combo[1] }
        bad_combo = (combos & %w[ab cd pq xy]).any?

        three_vowels(word) && good_combo && !bad_combo
      end
    end

    def double_pair(word)
      two_combos = word.chars.each_cons(2).map(&:join)
      two_combos.each_with_index.any? do |combo, index|
        other_combos = two_combos.reject.each_with_index { |_v, i| ([i - 1, 0].max..i + 1).cover?(index) }
        other_combos.include?(combo)
      end
    end

    def part_2
      data.count do |word|
        three_combos = word.chars.each_cons(3).map(&:join)
        mini_palindrome = three_combos.any? { |combo| combo[0] == combo[2] }

        double_pair(word) && mini_palindrome
      end
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
