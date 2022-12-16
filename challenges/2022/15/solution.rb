# frozen_string_literal: true

module Year2022
  class Day15 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      y_of_interest = 10
      # y_of_interest = 2_000_000
      xs_of_interest = data.filter_map do |line|
        s_x, s_y, b_x, b_y = line

        distance = (s_x - b_x).magnitude + (s_y - b_y).magnitude

        distance_away = (y_of_interest - s_y).abs
        num_coords_on_line = [(-2 * distance_away) + ((distance * 2) + 1), 0].max

        next unless num_coords_on_line.positive?

        (s_x - (distance - distance_away)..s_x + (distance - distance_away)).to_a
      end.flatten(1).sort.uniq

      beacons_on_y_of_interest = data.filter_map do |line|
        _, _, b_x, b_y = line

        b_x if b_y == y_of_interest
      end.uniq

      beacons_on_y_of_interest.each do |beacon|
        xs_of_interest.delete(beacon)
      end

      xs_of_interest.count
    end

    def part_2
      up_lines = []
      down_lines = []
      data.each do |line|
        s_x, s_y, b_x, b_y = line
        distance_plus_one = (s_x - b_x).magnitude + (s_y - b_y).magnitude + 1
        right = [s_x + distance_plus_one, s_y]
        left = [s_x - distance_plus_one, s_y]
        top = [s_x, s_y + distance_plus_one]
        bottom = [s_x, s_y - distance_plus_one]

        up_lines += [[left, top], [bottom, right]]
        down_lines += [[top, right], [left, bottom]]
      end

      points = Set.new
      up_lines.each do |up_line|
        up_x1, up_y1 = up_line[0]
        up_x2, up_y2 = up_line[1]

        down_lines.each do |down_line|
          down_x1, down_y1 = down_line[0]
          down_x2, = down_line[1]

          s = Rational(down_y1 - up_y1 + down_x1 - up_x1, 2 * (up_x2 - up_x1))
          t = Rational(down_y1 - up_y1 - (down_x1 - up_x1), 2 * (down_x2 - down_x1))

          next unless s >= 0 && s <= 1 && t >= 0 && t <= 1

          x_s = up_x1 + (s * (up_x2 - up_x1))
          y_s = up_y1 + (s * (up_y2 - up_y1))

          next unless x_s.denominator == 1

          points << [x_s.to_i, y_s.to_i]
        end
      end

      point_of_interest = points.sort.find do |point|
        p_x, p_y = point
        maybe = data.all? do |line|
          s_x, s_y, b_x, b_y = line
          beacon_distance = (s_x - b_x).magnitude + (s_y - b_y).magnitude
          point_distance = (s_x - p_x).magnitude + (s_y - p_y).magnitude
          beacon_distance < point_distance
        end
        # maybe && p_x >= 0 && p_x <= 20 && p_y >= 0 && p_y <= 20
        maybe && p_x >= 0 && p_x <= 4_000_000 && p_y >= 0 && p_y <= 4_000_000
      end

      (point_of_interest[0] * 4_000_000) + point_of_interest[1]
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_line_segment(line, index)
      line[index].split(Regexp.union(['=', ','])).last.to_i
    end

    def process_input(line)
      line = line.split
      s_x = process_line_segment(line, 2)
      s_y = process_line_segment(line, 3)
      b_x = process_line_segment(line, 8)
      b_y = process_line_segment(line, 9)
      [s_x, s_y, b_x, b_y]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
