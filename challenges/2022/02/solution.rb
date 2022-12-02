# frozen_string_literal: true

module Year2022
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    LOSE_POINTS = 0
    DRAW_POINTS = 3
    WIN_POINTS  = 6

    ROCK_POINTS     = 1
    PAPER_POINTS    = 2
    SCISSORS_POINTS = 3

    OPPONENT_ROCK     = 'A'
    OPPONENT_PAPER    = 'B'
    OPPONENT_SCISSORS = 'C'

    MY_ROCK     = 'X'
    MY_PAPER    = 'Y'
    MY_SCISSORS = 'Z'

    MY_PICK_SCORE_HASH = {
      OPPONENT_ROCK => {
        MY_ROCK => DRAW_POINTS,
        MY_PAPER => WIN_POINTS,
        MY_SCISSORS => LOSE_POINTS
      },
      OPPONENT_PAPER => {
        MY_ROCK => LOSE_POINTS,
        MY_PAPER => DRAW_POINTS,
        MY_SCISSORS => WIN_POINTS
      },
      OPPONENT_SCISSORS => {
        MY_ROCK => WIN_POINTS,
        MY_PAPER => LOSE_POINTS,
        MY_SCISSORS => DRAW_POINTS
      }
    }.freeze

    def part_1
      data.sum do |round|
        opponent_pick = round[0]
        my_pick = round[1]
        outcome_score = MY_PICK_SCORE_HASH[opponent_pick][my_pick]
        selection_score = case my_pick
                          when MY_ROCK
                            ROCK_POINTS
                          when MY_PAPER
                            PAPER_POINTS
                          when MY_SCISSORS
                            SCISSORS_POINTS
                          end
        outcome_score + selection_score
      end
    end

    MY_LOSE = 'X'
    MY_DRAW = 'Y'
    MY_WIN  = 'Z'

    MY_OUTCOME_SCORE_HASH = {
      OPPONENT_ROCK => {
        MY_LOSE => SCISSORS_POINTS,
        MY_DRAW => ROCK_POINTS,
        MY_WIN => PAPER_POINTS
      },
      OPPONENT_PAPER => {
        MY_LOSE => ROCK_POINTS,
        MY_DRAW => PAPER_POINTS,
        MY_WIN => SCISSORS_POINTS
      },
      OPPONENT_SCISSORS => {
        MY_LOSE => PAPER_POINTS,
        MY_DRAW => SCISSORS_POINTS,
        MY_WIN => ROCK_POINTS
      }
    }.freeze

    def part_2
      data.sum do |round|
        opponent_pick = round[0]
        my_outcome = round[1]
        outcome_score = case my_outcome
                        when MY_LOSE
                          LOSE_POINTS
                        when MY_DRAW
                          DRAW_POINTS
                        when MY_WIN
                          WIN_POINTS
                        end
        selection_score = MY_OUTCOME_SCORE_HASH[opponent_pick][my_outcome]
        outcome_score + selection_score
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      [line[0], line[2]]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
