# frozen_string_literal: true

module Year2023
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sum do |line|
        next line.id if line.max_blue <= 14 && line.max_green <= 13 && line.max_red <= 12

        0
      end
    end

    def part_2
      data.sum do |line|
        line.max_blue * line.max_green * line.max_red
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      SnowGame.new(line)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end

class SnowGame
  attr_reader :id

  def initialize(game)
    @game = game
    @id = game[game.index(' ') + 1..game.index(':') - 1].to_i
    @reveals = game.split(':')[1].split(';').map { |reveal| SnowGameReveal.new(reveal) }
  end

  def max_blue
    @reveals.max_by(&:blue).blue
  end

  def max_green
    @reveals.max_by(&:green).green
  end

  def max_red
    @reveals.max_by(&:red).red
  end
end

class SnowGameReveal
  attr_reader :blue, :green, :red

  def initialize(reveal)
    @reveal = reveal
    @blue = color_amount('blue')
    @green = color_amount('green')
    @red = color_amount('red')
  end

  def color_amount(color)
    color_index = @reveal.index(color)
    comma_index = @reveal[0..color_index].rindex(',') || -1

    return 0 if color_index.nil?

    @reveal[comma_index + 2..color_index - 2].to_i
  end
end
