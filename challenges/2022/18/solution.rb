# frozen_string_literal: true

module Year2022
  class Day18 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def cubes_touching?(point1, point2)
      x1, y1, z1 = point1
      x2, y2, z2 = point2

      return false unless point1.select.with_index { |a, index| a == point2[index] }.count == 2

      x_touch = (x1 - x2).abs == 1
      y_touch = (y1 - y2).abs == 1
      z_touch = (z1 - z2).abs == 1

      x_touch || y_touch || z_touch
    end

    def exposed_surfaces(points)
      points.sum do |point1|
        num_covered = 0
        points.each do |point2|
          num_covered += 1 if cubes_touching?(point1, point2)
        end

        6 - num_covered
      end
    end

    def part_1
      exposed_surfaces(data)
    end

    def all_coordinates(grid)
      x = grid.count - 1
      (0..x).to_a.product((0..x).to_a).product((0..x).to_a).flatten.each_slice(3).to_a
    end

    def part_2
      max_size = 23
      @lava_droplets = Array.new(max_size) { Array.new(max_size) { '.' * max_size } }
      data.each do |droplet|
        x, y, z = droplet
        @lava_droplets[x][y][z] = '#'
      end

      possible_air_spots = all_coordinates(@lava_droplets)

      @dp = {}
      air_spots = possible_air_spots.select do |possible_air_spot|
        path = [possible_air_spot]
        dfs(source: possible_air_spot, path: path)
      end

      exposed_surfaces((data + air_spots.to_a).uniq)
    end

    def on_edge?(pos_x, pos_y, pos_z)
      max_size = @lava_droplets.count

      pos_x.zero? || pos_x == max_size - 1 ||
        pos_y.zero? || pos_y == max_size - 1 ||
        pos_z.zero? || pos_z == max_size - 1
    end

    def dfs(source:, path:)
      x, y, z = source

      if on_edge?(x, y, z)
        return true if @lava_droplets[x][y][z] == '#'

        return false
      end

      return @dp[source] if @dp.key?(source)

      trapped = true
      neighbors(source).each do |neighbor|
        next if path.include?(neighbor)

        path << neighbor

        trapped = dfs(source: neighbor, path: path)

        @dp[source] = trapped

        return false unless trapped

        path.pop
      end

      trapped
    end

    def beyond_edge?(pos_x, pos_y, pos_z)
      max_size = @lava_droplets.count

      pos_x.negative? || pos_x > max_size - 1 ||
        pos_y.negative? || pos_y > max_size - 1 ||
        pos_z.negative? || pos_z > max_size - 1
    end

    def neighbors(point)
      x, y, z = point

      [
        [x + 1, y, z],
        [x - 1, y, z],
        [x, y + 1, z],
        [x, y - 1, z],
        [x, y, z + 1],
        [x, y, z - 1]
      ].select do |possible_neighbor|
        x, y, z = possible_neighbor

        next false if beyond_edge?(x, y, z)

        next false if @lava_droplets[x][y][z] == '#'

        true
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(',').map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
