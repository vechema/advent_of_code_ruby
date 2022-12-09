# frozen_string_literal: true

module Year2022
  class Day08 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.count do |tree|
        true if tree.edge_tree? || tree.see_edge?
      end
    end

    def part_2
      data.map(&:visibility).max
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.chars.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      set_to_i = set.map do |line|
        line.chars.map(&:to_i)
      end

      set_to_i.each_with_index.flat_map do |row, row_index|
        row.each_with_index.map do |_col, col_index|
          GroveTree.new(
            grove: set_to_i,
            row_index: row_index,
            col_index: col_index
          )
        end
      end
    end
  end
end

class GroveTree
  def initialize(grove:, row_index:, col_index:)
    @grove = grove
    @row_index = row_index
    @col_index = col_index

    @max_x = grove[0].length - 1
    @max_y = grove.length - 1
  end

  def edge_tree?
    @row_index.zero? || @col_index.zero? || @row_index == @max_x || @col_index == @max_y
  end

  def see_edge?
    [see_edge_up?, see_edge_down?, see_edge_left?, see_edge_right?].any?
  end

  def visibility
    visible_up * visible_down * visible_left * visible_right
  end

  private

  def tree_height
    @grove[@row_index][@col_index]
  end

  def up
    (0...@row_index).to_a.reverse
  end

  def visible_up
    visibility_distance(up, false, @col_index)
  end

  def see_edge_up?
    edge_up = @grove[0][@col_index]
    up_visible = visible_up
    up_visible -= 1 if edge_up >= tree_height
    (up_visible - up.size).zero?
  end

  def down
    ((@row_index + 1)..@max_x)
  end

  def visible_down
    visibility_distance(down, false, @col_index)
  end

  def see_edge_down?
    edge_down = @grove[@max_x][@col_index]
    down_visible = visible_down
    down_visible -= 1 if edge_down >= tree_height
    (down_visible - down.size).zero?
  end

  def left
    (0...@col_index).to_a.reverse
  end

  def visible_left
    visibility_distance(left, true, @row_index)
  end

  def see_edge_left?
    edge_left = @grove[@row_index][0]
    left_visible = visible_left
    left_visible -= 1 if edge_left >= tree_height
    (left_visible - left.size).zero?
  end

  def right
    ((@col_index + 1)..@max_y)
  end

  def visible_right
    visibility_distance(right, true, @row_index)
  end

  def see_edge_right?
    edge_right = @grove[@row_index][@max_y]
    right_visible = visible_right
    right_visible -= 1 if edge_right >= tree_height
    (right_visible - right.size).zero?
  end

  def visibility_distance(indices, horizontal, other_index)
    done = false
    indices.count do |index|
      height = horizontal ? @grove[other_index][index] : @grove[index][other_index]

      next if done

      done = tree_height <= height || done

      true
    end
  end
end
