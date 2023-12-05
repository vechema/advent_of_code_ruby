# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2023::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2023/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..
    EOF
  end

  describe 'part 1' do
    it 'returns nil for the example input' do
      expect(described_class.part_1(example_input)).to eq(4361)
    end

    # SLOW - 11 seconds
    it 'returns nil for my input' do
      # expect(described_class.part_1(input)).to eq(533_784)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input)).to eq(467_835)
    end

    # SLOW - 5 seconds
    it 'returns nil for my input' do
      # expect(described_class.part_2(input)).to eq(78_826_761)
    end
  end
end
