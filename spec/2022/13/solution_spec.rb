# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day13 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/13/input.txt')) }
  let(:example_input) do
    <<~EOF
      [1,1,3,1,1]
      [1,1,5,1,1]

      [[1],[2,3,4]]
      [[1],4]

      [9]
      [[8,7,6]]

      [[4,4],4,4]
      [[4,4],4,4,4]

      [7,7,7,7]
      [7,7,7]

      []
      [3]

      [[[]]]
      [[]]

      [1,[2,[3,[4,[5,6,7]]]],8,9]
      [1,[2,[3,[4,[5,6,0]]]],8,9]

    EOF
  end

  describe 'part 1' do
    it 'returns 13 for the example input' do
      expect(described_class.part_1(example_input)).to eq(13)
    end

    it 'returns 5843 for my input' do
      expect(described_class.part_1(input)).to eq(5843)
    end
  end

  describe 'part 2' do
    it 'returns 140 for the example input' do
      expect(described_class.part_2(example_input)).to eq(140)
    end

    it 'returns 26289 for my input' do
      expect(described_class.part_2(input)).to eq(26_289)
    end
  end
end
