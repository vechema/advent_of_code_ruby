# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Naming/MethodParameterName
# rubocop:disable Metrics/AbcSize
module Year2022
  class Day22 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def move(maze, x, y, direction, movement)
      walkable = ['.', '<', '>', '^', 'v']

      case direction
      when 'N'
        movement.times do
          maze[x][y] = '^'

          new_x = x - 1

          if new_x.negative? || maze[new_x][y] == ' ' || maze[new_x][y].nil?
            new_x = x
            (maze.count - 1).downto(x).each do |row|
              if walkable.include?(maze[row][y])
                new_x = row
                break
              end
              break if maze[row][y] == '#'
            end
            x = new_x
          elsif walkable.include?(maze[new_x][y])
            x -= 1
          end
        end
        maze[x][y] = 'N'
      when 'S'
        movement.times do
          maze[x][y] = 'v'

          if maze[x + 1].nil? || maze[x + 1][y].nil? || maze[x + 1][y] == ' '
            new_x = x
            (0..x).each do |row|
              if walkable.include?(maze[row][y])
                new_x = row
                break
              end
              break if maze[row][y] == '#'
            end
            x = new_x
          elsif walkable.include?(maze[x + 1][y])
            x += 1
          end
        end
        maze[x][y] = 'S'
      when 'E'
        movement.times do
          maze[x][y] = '>'

          if maze[x][y + 1].nil?
            index_of_walkable = walkable.map { |c| maze[x].index(c) }.compact.min
            y = index_of_walkable if maze[x].index('#').nil? || index_of_walkable < maze[x].index('#')
          elsif walkable.include?(maze[x][y + 1])
            y += 1
          end
        end
        maze[x][y] = 'E'
      when 'W'
        movement.times do
          maze[x][y] = '<'

          if (y - 1).negative? || maze[x][y - 1] == ' '
            index_of_walkable = walkable.map { |c| maze[x].rindex(c) }.compact.max
            y = index_of_walkable if maze[x].rindex('#').nil? || index_of_walkable > maze[x].rindex('#')
          elsif walkable.include?(maze[x][y - 1])
            y -= 1
          end
        end
        maze[x][y] = 'W'
      end

      [x, y]
    end

    def part_1
      maze, movements = data
      # maze.each do |row|
      #   p row
      # end

      directions = %w[E S W N]
      current_direction = 0

      # p movements
      x = 0
      y = maze[0].index('.')
      maze[x][y] = '>'

      movements.each do |movement|
        if movement.to_s.to_i == movement
          x, y = move(maze, x, y, directions[current_direction], movement)

        else
          current_direction = if movement == 'R'
                                (current_direction + 1) % 4
                              else
                                (current_direction - 1) % 4
                              end
        end

        # puts '-' * 200
        # puts
        # puts "#{directions[current_direction]}"
        # maze.each do |row|
        #   puts row.join
        # end
      end
      # p x
      # p y
      # p current_direction
      ((x + 1) * 1000) + ((y + 1) * 4) + current_direction
    end

    def move_cube(maze, x, y, direction, movement)
      walkable = ['.', '<', '>', '^', 'v']

      case direction
      when 'N'
        movement.times do
          maze[x][y] = '^'

          new_x = x - 1

          if new_x.negative? || maze[new_x][y] == ' ' || maze[new_x][y].nil?
            new_x = x
            (maze.count - 1).downto(x).each do |row|
              if walkable.include?(maze[row][y])
                new_x = row
                break
              end
              break if maze[row][y] == '#'
            end
            x = new_x
          elsif walkable.include?(maze[new_x][y])
            x -= 1
          end
        end
        maze[x][y] = 'N'
      when 'S'
        movement.times do
          maze[x][y] = 'v'

          if maze[x + 1].nil? || maze[x + 1][y].nil? || maze[x + 1][y] == ' '
            new_x = x
            (0..x).each do |row|
              if walkable.include?(maze[row][y])
                new_x = row
                break
              end
              break if maze[row][y] == '#'
            end
            x = new_x
          elsif walkable.include?(maze[x + 1][y])
            x += 1
          end
        end
        maze[x][y] = 'S'
      when 'E'
        movement.times do
          maze[x][y] = '>'

          if maze[x][y + 1].nil?
            index_of_walkable = walkable.map { |c| maze[x].index(c) }.compact.min
            y = index_of_walkable if maze[x].index('#').nil? || index_of_walkable < maze[x].index('#')
          elsif walkable.include?(maze[x][y + 1])
            y += 1
          end
        end
        maze[x][y] = 'E'
      when 'W'
        movement.times do
          maze[x][y] = '<'

          if (y - 1).negative? || maze[x][y - 1] == ' '
            index_of_walkable = walkable.map { |c| maze[x].rindex(c) }.compact.max
            y = index_of_walkable if maze[x].rindex('#').nil? || index_of_walkable > maze[x].rindex('#')
          elsif walkable.include?(maze[x][y - 1])
            y -= 1
          end
        end
        maze[x][y] = 'W'
      end

      [x, y]
    end

    # CUBE!
    # Figure out cube by finding an adjacent corner then start going out
    # If you only turn ONE edge, then the side matches up. If turn two edges, need to find the next adjacent corner
    # Create a map from each point on the edge of a face & direction for going off the edge
    #   to the point it would land on and what the new direction would be
    def part_2
      maze, movements = data
      # maze.each do |row|
      #   p row
      # end

      directions = %w[E S W N]
      current_direction = 0

      # p movements
      x = 0
      y = maze[0].index('.')
      maze[x][y] = '>'

      movements.each do |movement|
        if movement.to_s.to_i == movement
          x, y = move_cube(maze, x, y, directions[current_direction], movement)

        else
          current_direction = if movement == 'R'
                                (current_direction + 1) % 4
                              else
                                (current_direction - 1) % 4
                              end
        end

        # puts '-' * 200
        # puts
        # puts "#{directions[current_direction]}"
        # maze.each do |row|
        #   puts row.join
        # end
      end
      # p x
      # p y
      # p current_direction
      p ((x + 1) * 1000) + ((y + 1) * 4) + current_direction

      nil
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      maze = []
      set.each_with_index do |line, row_index|
        break if line == ''

        maze[row_index] ||= []
        line.chars.each_with_index do |char, col_index|
          maze[row_index][col_index] = char
        end
      end

      movements = set.last.scan(/\d+|[A-Za-z]+/)
      movements = movements.each_slice(2).flat_map do |movement|
        amount, turn = movement
        [amount.to_i, turn]
      end.compact

      [maze, movements]
    end
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Naming/MethodParameterName
# rubocop:enable Metrics/AbcSize
