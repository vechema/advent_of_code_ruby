# frozen_string_literal: true

module Year2022
  class Day19 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def best_possible(time_left)
      (time_left * (time_left + 1)) / 2
    end

    def key(resources, robots, time_left)
      # key = "#{resources.join(',')}:#{robots.join(',')}:#{time_left}"
      exp = 1
      resources.map do |x|
        exp += 1
        exp**x
      end.sum * robots.map { |y| 5**y }.sum * (11**time_left)
    end

    def options(resources, robots)
      ore, clay, obsidian, = resources
      @blueprints.map.with_index do |blueprint, index|
        ore_needed, clay_needed, obsidian_needed = blueprint

        next -1 if (@maxes[index]).positive? && (robots[index - 1] >= @maxes[index])

        next index if ore >= ore_needed && clay >= clay_needed && obsidian >= obsidian_needed

        -1
      end
    end

    def try_options(options, resources, robots, time_left)
      ore, clay, obsidian, geode = resources
      options.reverse.each do |option|
        next if option == -1

        ore_used, clay_used, obsidian_used = @blueprints[option]
        new_resources = [ore - ore_used, clay - clay_used, obsidian - obsidian_used, geode]

        new_robots = robots.clone
        new_robots[option - 1] += 1 if option >= 1

        score = dfs(resources: new_resources,
                    robots: new_robots,
                    time_left: time_left - 1)

        @best = [@best, score].max
      end
    end

    def dfs(resources:, robots:, time_left:)
      ore, clay, obsidian, geode = resources
      ore_robot, clay_robot, obsidian_robot, geode_robot = robots

      return geode if time_left.zero?

      geode += geode_robot
      return 0 if @best >= best_possible(time_left) + geode + (geode_robot * time_left)

      key = key(resources, robots, time_left)
      return @dp[key] if @dp.key?(key)

      options = options(resources, robots)

      ore += ore_robot
      clay += clay_robot
      obsidian += obsidian_robot
      try_options(options, [ore, clay, obsidian, geode], robots, time_left)

      @dp[key] = @best

      @best
    end

    def part_1
      data.each_with_index.sum do |line, index|
        max_ore = line.map { |x| x[0] }.max
        max_clay = line.map { |x| x[1] }.max
        max_obsidian = line.map { |x| x[2] }.max

        @maxes = [0, max_ore, max_clay, max_obsidian, 0]
        @blueprints = line
        @best = 0
        @dp = {}
        score = dfs(resources: [0, 0, 0, 0],
                    robots: [1, 0, 0, 0],
                    time_left: 24)

        score * (index + 1)
      end
    end

    def part_2
      data.each_with_index.map do |line, index|
        next 1 if index > 2

        max_ore = line.map { |x| x[0] }.max
        max_clay = line.map { |x| x[1] }.max
        max_obsidian = line.map { |x| x[2] }.max

        @maxes = [0, max_ore, max_clay, max_obsidian, 0]
        @blueprints = line
        @best = 0
        @dp = {}
        score = dfs(resources: [0, 0, 0, 0],
                    robots: [1, 0, 0, 0],
                    time_left: 32)

        score
      end.inject(:*)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split
      ore_robot = line[6].to_i

      clay_robot = line[12].to_i

      obsidian_robot_ore = line[18].to_i
      obsidian_robot_clay = line[21].to_i

      geode_robot_ore = line[27].to_i
      geode_robot_obsidian = line[30].to_i

      [
        [0, 0, 0],
        [ore_robot, 0, 0],
        [clay_robot, 0, 0],
        [obsidian_robot_ore, obsidian_robot_clay, 0],
        [geode_robot_ore, 0, geode_robot_obsidian]
      ]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
