# frozen_string_literal: true

module Year2016
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def real_room?(checksum, name)
      tally = name.chars.tally

      tally = tally.to_a.sort do |item1, item2|
        letter1, count1 = item1
        letter2, count2 = item2
        next -1 if count1 > count2 || (count1 == count2 && letter1 < letter2)

        1
      end

      tally.first(5).map { |x| x[0] }.sort == checksum.chars.sort
    end

    def part_1
      sum = 0
      data.each do |line|
        sector_id, checksum, name = line
        sum += sector_id if real_room?(checksum, name)
      end

      sum
    end

    def part_2
      data.filter_map do |line|
        sector_id, checksum, name = line
        next unless real_room?(checksum, name)

        real_name = name.chars.map do |char|
          ((((char.ord + (sector_id % 26)) - 'a'.ord) % 26) + 'a'.ord).chr
        end

        return sector_id if real_name.join == 'northpoleobjectstorage'
      end
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line = line.split('-')
      sector_id = line.last.split('[')[0].to_i
      checksum = line.last[4..8]

      [sector_id, checksum, line.first(line.size - 1).join]
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
