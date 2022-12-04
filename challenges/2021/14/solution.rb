# frozen_string_literal: true

module Year2021
  class Day14 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    # SO SLOW
    # def transform_polymer_v1(steps:)
    #   # what to put in process_dataset
    #   # polymer_template = set[0]

    #   # pair_insertions = set.drop(2).filter_map do |pair_insertion|
    #   #   next nil if pair_insertion.empty?

    #   #   pair_insertion.split(' -> ')
    #   # end
    #   polymer_template, pair_insertions = data

    #   steps.times do
    #     insertions = pair_insertions.flat_map do |pair_insertion|
    #       pair, new_element = pair_insertion
    #       insert_indices = polymer_template.enum_for(:scan, /(?=#{pair})/).map do
    #         Regexp.last_match.offset(0).first
    #       end
    #       insert_indices.map do |insert_index|
    #         [insert_index, new_element]
    #       end
    #     end

    #     insertions = insertions.sort_by { |insertion| insertion[0] }.reverse
    #     insertions.each do |insertion|
    #       index = insertion[0]
    #       new_element = insertion[1]
    #       polymer_template.insert(index + 1, new_element)
    #     end
    #   end

    #   tally = polymer_template.chars.tally
    #   most_common_count = tally.max_by { |_k, v| v }[1]
    #   least_common_count = tally.min_by { |_k, v| v }[1]

    #   most_common_count - least_common_count
    # end

    # Even worse...
    # def transform_polymer_v2(steps:)
    #   # what to put in process_dataset
    #   # polymer_template = set[0].chars.each_cons(2).map do |pair|
    #   #   pair.join
    #   # end

    #   # pair_insertions = set.drop(2).filter_map do |pair_insertion|
    #   #   next nil if pair_insertion.empty?

    #   #   pair_insertion.split(' -> ')
    #   # end
    #   polymer_template, pair_insertions = data

    #   skip_next = false
    #   steps.times do
    #     polymer_template.each_with_index do |template_pair, index|
    #       if skip_next
    #         skip_next = false
    #         next
    #       end

    #       pair_insertions.each do |pair_insertion|
    #         pair, new_element = pair_insertion
    #         next unless pair == template_pair

    #         polymer_template[index] = template_pair[0] + new_element
    #         polymer_template.insert(index + 1, new_element + template_pair[1])
    #         skip_next = true
    #         break
    #       end
    #     end
    #   end

    #   polymer_template = polymer_template[0] + polymer_template.drop(1).map { |pair| pair[1] }.join

    #   tally = polymer_template.chars.tally
    #   most_common_count = tally.max_by { |_k, v| v }[1]
    #   least_common_count = tally.min_by { |_k, v| v }[1]

    #   most_common_count - least_common_count
    # end

    def transform_polymer(steps:)
      polymer_template, pair_insertions = data

      last_letter = polymer_template.keys.last[1]

      polymer_template = final_polymer_template_pairs(
        polymer_template: polymer_template,
        pair_insertions: pair_insertions,
        steps: steps
      )

      polymer_tally = polymer_letter_tally(
        polymer_template: polymer_template,
        last_letter: last_letter
      )

      most_common_count = polymer_tally.max_by { |_k, v| v }[1]
      least_common_count = polymer_tally.min_by { |_k, v| v }[1]

      most_common_count - least_common_count
    end

    def final_polymer_template_pairs(polymer_template:, pair_insertions:, steps:)
      steps.times do
        new_polymer_template = {}
        polymer_template.each do |pair, count|
          new_element = pair_insertions[pair]
          new_polymer_template[pair[0] + new_element] ||= 0
          new_polymer_template[new_element + pair[1]] ||= 0

          new_polymer_template[pair[0] + new_element] += count
          new_polymer_template[new_element + pair[1]] += count
        end
        polymer_template = new_polymer_template
      end
      polymer_template
    end

    def polymer_letter_tally(polymer_template:, last_letter:)
      single_letter_count = {}
      polymer_template.each do |k, v|
        single_letter_count[k[0]] ||= 0
        single_letter_count[k[0]] += v
      end
      single_letter_count[last_letter] ||= 0
      single_letter_count[last_letter] += 1

      single_letter_count
    end

    def part_1
      transform_polymer(steps: 10)
    end

    def part_2
      transform_polymer(steps: 40)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      polymer_template = set[0].chars.each_cons(2).map(&:join).tally

      pair_insertions = set.drop(2).filter_map do |pair_insertion|
        next nil if pair_insertion.empty?

        pair_insertion.split(' -> ')
      end.to_h
      [polymer_template, pair_insertions]
    end
  end
end
