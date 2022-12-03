# frozen_string_literal: true

module Year2021
  class Day10 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum(&:corrupt_score)
    end

    def part_2
      incomplete_scores = data.map(&:incomplete_score).reject(&:zero?).sort

      incomplete_scores[incomplete_scores.size / 2]
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      NavigationLine.new(line: line)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end

class NavigationLine
  CURLY = ['{', '}'].freeze
  POINT = ['<', '>'].freeze
  ROUND = ['(', ')'].freeze
  SQUARE = ['[', ']'].freeze
  CHARS = [CURLY, POINT, ROUND, SQUARE].freeze

  def initialize(line:)
    @line = line
  end

  def corrupt_score
    scores = {
      CURLY[1] => 1197,
      POINT[1] => 25_137,
      ROUND[1] => 3,
      SQUARE[1] => 57
    }
    scores[chunk_processing] || 0
  end

  def incomplete_score
    opening_chars = chunk_processing
    return 0 unless opening_chars.instance_of?(Array)

    score = 0
    until opening_chars.empty?
      opening_char = opening_chars.pop
      score = (score * 5) + NavigationLine.incomplete_char_score(opening_char)
    end

    score
  end

  def self.incomplete_char_score(char)
    scores = {
      CURLY[0] => 3,
      POINT[0] => 4,
      ROUND[0] => 1,
      SQUARE[0] => 2
    }
    scores[char] || 0
  end

  def self.matching_chars?(open:, close:)
    CHARS.any? { |x, y| x == open && y == close }
  end

  def self.opening_char?(char)
    CHARS.map { |x| x[0] }.include?(char)
  end

  private

  def chunk_processing
    stack = []
    @line.chars.each do |char|
      if NavigationLine.opening_char?(char)
        stack.push(char)
      else
        open_char = stack.pop
        return char unless NavigationLine.matching_chars?(open: open_char, close: char)
      end
    end
    stack
  end
end
