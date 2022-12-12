# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day11 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/11/input.txt')) }
  let(:example_input) do
    <<~EOF
      Monkey 0:
        Starting items: 79, 98
        Operation: new = old * 19
        Test: divisible by 23
          If true: throw to monkey 2
          If false: throw to monkey 3

      Monkey 1:
        Starting items: 54, 65, 75, 74
        Operation: new = old + 6
        Test: divisible by 19
          If true: throw to monkey 2
          If false: throw to monkey 0

      Monkey 2:
        Starting items: 79, 60, 97
        Operation: new = old * old
        Test: divisible by 13
          If true: throw to monkey 1
          If false: throw to monkey 3

      Monkey 3:
        Starting items: 74
        Operation: new = old + 3
        Test: divisible by 17
          If true: throw to monkey 0
          If false: throw to monkey 1
    EOF
  end

  describe 'part 1' do
    it 'returns 10605 for the example input' do
      expect(described_class.part_1(example_input)).to eq(10_605)
    end

    it 'returns 110220 for my input' do
      expect(described_class.part_1(input)).to eq(110_220)
    end
  end

  describe 'part 2' do
    it 'returns 2713310158 for the example input' do
      expect(described_class.part_2(example_input)).to eq(2_713_310_158)
    end

    # SLOW
    # it 'returns 19457438264 for my input' do
    #   expect(described_class.part_2(input)).to eq(19_457_438_264)
    # end
  end
end
