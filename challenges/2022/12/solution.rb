# frozen_string_literal: true

module Year2022
  class Day12 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def min_distance(queue, dist)
      queue.keys.min do |coor1, coor2|
        x1, y1 = coor1
        x2, y2 = coor2
        dist[x1][y1] <=> dist[x2][y2]
      end
    end

    def neighbors(row, col, data)
      all_coordinates = [
        [row + 1, col],
        [row - 1, col],
        [row, col + 1],
        [row, col - 1]
      ]
      all_coordinates.select { |r, c| r >= 0 && c >= 0 }
                     .select { |r, c| r < data.count && c < data[0].count }
                     .select { |r, c| data[r][c].ord >= data[row][col].ord - 1 }
    end

    def mark_special_spots(height, row_index, col_index, data, dist)
      case height
      when 'S'
        data[row_index][col_index] = 'a'
      when 'E'
        dist[row_index][col_index] = 0
        data[row_index][col_index] = 'z'
      end
    end

    def dijkstra_setup
      num_rows = data.count

      dist = Array.new(num_rows) { [] }
      prev = Array.new(num_rows) { [] }
      q = {}
      data.each_with_index do |row, row_index|
        row.each_with_index do |height, col_index|
          dist[row_index][col_index] = 10_000_000
          prev[row_index][col_index] = nil
          q[[row_index, col_index]] = 0

          mark_special_spots(height, row_index, col_index, data, dist)
        end
      end

      [dist, prev, q]
    end

    def calculate_distance
      dist, prev, q = dijkstra_setup

      until q.empty?

        row, col = min_distance(q, dist)

        q.delete([row, col])

        neighbors(row, col, data).each do |n_row, n_col|
          next unless q.key?([n_row, n_col])

          alt = dist[row][col] + 1
          if alt < dist[n_row][n_col]
            dist[n_row][n_col] = alt
            prev[n_row][n_col] = [row, col]
          end
        end
      end

      dist
    end

    def part_1
      finish = [0, 0]
      data.each_with_index do |row, row_index|
        row.each_with_index do |height, col_index|
          finish = [row_index, col_index] if height == 'S'
        end
      end

      calculate_distance[finish[0]][finish[1]]
    end

    def part_2
      dist = calculate_distance

      data.each_with_index.flat_map do |row, row_index|
        row.each_with_index.filter_map do |_, col_index|
          dist[row_index][col_index] if data[row_index][col_index] == 'a'
        end
      end.min
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
