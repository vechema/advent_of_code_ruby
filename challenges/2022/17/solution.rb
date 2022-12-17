# frozen_string_literal: true

module Year2022
  class Day17 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def rock_height_to_deltas(rock_heights)
      rock_heights.each_cons(2).map do |x|
        x[1] - x[0]
      end
    end

    def find_pattern(rock_height_diffs)
      length = data.count
      offset = 0
      found_pattern = false
      while offset < rock_height_diffs.count / 2
        while length < rock_height_diffs.count / 2
          left = rock_height_diffs[offset..(length + offset)]
          right = rock_height_diffs[(length + offset + 1)..((2 * length) + offset + 1)]

          if left == right
            found_pattern = true
            break
          end

          length += 1
        end
        break if found_pattern

        length = data.count

        offset += 1
      end

      [length, offset]
    end

    def repeat_sum(target_rocks, offset, length, length_heights)
      full_repeats = (target_rocks - offset) / (length + 1)
      (full_repeats * length_heights.sum)
    end

    def last_bit_sum(target_rocks, offset, length, length_heights)
      last_bit = (target_rocks - offset) % (length + 1)
      length_heights[0..last_bit - 2].sum + 1
    end

    def height(target_rocks)
      rock_height_diffs = rock_height_to_deltas(RockTower.new(data).rock_heights)

      length, offset = find_pattern(rock_height_diffs)

      length_heights = rock_height_diffs[offset..(offset + length)]

      offset_sum = rock_height_diffs[0..offset - 1].sum
      repeat_sum = repeat_sum(target_rocks, offset, length, length_heights)
      last_bit_sum = last_bit_sum(target_rocks, offset, length, length_heights)

      offset_sum + repeat_sum + last_bit_sum
    end

    def part_1
      height(2022)
    end

    def part_2
      height(1_000_000_000_000)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.chars
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end

class RockTower
  def initialize(directions)
    @directions = directions
  end

  def rock_heights
    cave = Array.new(4) { '.' * 7 }
    pos_x = 3
    pos_y = 2

    current_shape_index = 0
    current_shape = shapes[current_shape_index]

    rocks_fallen = 0
    rock_heights = []
    iterations = -1
    while rocks_fallen < @directions.count * 4
      iterations += 1

      pos_y = go_left_or_right(iterations, current_shape, pos_x, pos_y, cave)

      if can_move_down?(current_shape, pos_x, pos_y, cave)
        pos_x -= 1
      else
        rocks_fallen += 1
        mark_shape_in_cave(current_shape, pos_x, pos_y, cave)
        rock_heights << rock_height(cave)

        current_shape_index, current_shape, pos_x, pos_y = setup_next_shape(current_shape_index, cave)
      end
    end

    rock_heights
  end

  private

  def shapes
    horizontal_line = [[0, 0], [0, 1], [0, 2], [0, 3]]
    cross = [[0, 1], [1, 0], [1, 1], [1, 2], [2, 1]]
    corner = [[0, 0], [0, 1], [0, 2], [1, 2], [2, 2]]
    vertical_line = [[0, 0], [1, 0], [2, 0], [3, 0]]
    square = [[0, 0], [0, 1], [1, 0], [1, 1]]

    [horizontal_line, cross, corner, vertical_line, square]
  end

  def rock?(cave, row, col)
    cave[row] ||= '.' * 7
    cave[row][col] == '.'
  end

  def can_move_left?(current_shape, pos_x, pos_y, cave)
    min_y = current_shape.map { |a| a[1] }.min + pos_y

    current_shape.all? do |coord|
      next false if min_y < 1

      x, y = coord
      rock?(cave, x + pos_x, y + pos_y - 1)
    end
  end

  def can_move_right?(current_shape, pos_x, pos_y, cave)
    max_y = current_shape.map { |a| a[1] }.max + pos_y

    current_shape.all? do |coord|
      next false if max_y > 5

      x, y = coord
      rock?(cave, x + pos_x, y + pos_y + 1)
    end
  end

  def go_left_or_right(iterations, current_shape, pos_x, pos_y, cave)
    direction = @directions[iterations % @directions.count]

    case direction
    when '<'
      pos_y -= 1 if can_move_left?(current_shape, pos_x, pos_y, cave)
    when '>'
      pos_y += 1 if can_move_right?(current_shape, pos_x, pos_y, cave)
    end

    pos_y
  end

  def can_move_down?(current_shape, pos_x, pos_y, cave)
    min_x = current_shape.map { |a| a[0] }.min + pos_x

    current_shape.all? do |coord|
      next false if (min_x - 1).negative?

      x, y = coord
      rock?(cave, x + pos_x - 1, y + pos_y)
    end
  end

  def rock_height(cave)
    cave.rindex { |row| row.include?('#') } + 1
  end

  def mark_shape_in_cave(current_shape, pos_x, pos_y, cave)
    current_shape.each do |coor|
      x, y = coor
      cave[x + pos_x] ||= '.' * 7
      cave[x + pos_x][y + pos_y] = '#'
    end
  end

  def setup_next_shape(current_shape_index, cave)
    current_shape_index = (current_shape_index + 1) % shapes.count
    current_shape = shapes[current_shape_index]

    pos_x = 3 + rock_height(cave)
    pos_y = 2
    [current_shape_index, current_shape, pos_x, pos_y]
  end
end
