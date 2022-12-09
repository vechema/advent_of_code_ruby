# frozen_string_literal: true

module Year2022
  class Day09 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def move_tail?(primary1, primary2, perpendicular1, perpendicular2)
      # too far apart in primary direction
      #  || one far apart in primary direction & too far apart in perpendicular direction
      (primary1 - primary2 == 2) ||
        (primary1 - primary2 == 1 && perpendicular1 - perpendicular2 == 2) ||
        (primary1 - primary2 == 1 && perpendicular2 - perpendicular1 == 2)
    end

    def move_head(dir, rope)
      case dir
      when 'R'
        rope[0][1] += 1
      when 'U'
        rope[0][0] += 1
      when 'L'
        rope[0][1] -= 1
      when 'D'
        rope[0][0] -= 1
      end
    end

    def move_knot(head, tail)
      xh = head[1]
      xt = tail[1]
      yh = head[0]
      yt = tail[0]

      tail[1] += 1 if move_tail?(xh, xt, yh, yt)
      tail[1] -= 1 if move_tail?(xt, xh, yh, yt)
      tail[0] += 1 if move_tail?(yh, yt, xh, xt)
      tail[0] -= 1 if move_tail?(yt, yh, xh, xt)
    end

    def num_tail_spots_visited(rope_length)
      rope = Array.new(rope_length) { [0, 0] }
      tail_past = []

      data.each do |move|
        dir, amount = move
        amount.times do
          move_head(dir, rope)

          rope.drop(1).each_with_index do |tail, index|
            head = rope[index]
            move_knot(head, tail)

            tail_past << tail.dup if index == rope_length - 2
          end
        end
      end

      tail_past.uniq.count
    end

    def part_1
      num_tail_spots_visited(2)
    end

    def part_2
      num_tail_spots_visited(10)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split
      [line[0], line[1].to_i]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
