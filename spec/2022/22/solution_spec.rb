# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day22 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/22/input.txt')) }
  let(:example_input) do
    <<~EOF
              ...#
              .#..
              #...
              ....
      ...#.......#
      ........#...
      ..#....#....
      ..........#.
              ...#....
              .....#..
              .#......
              ......#.

      10R5L5R10L4R5L5
    EOF
  end

  describe 'part 1' do
    it 'returns 6032 for the example input' do
      expect(described_class.part_1(example_input)).to eq(6032)
    end

    it 'returns 36518 for my input' do
      expect(described_class.part_1(input)).to eq(36_518)
    end
  end

  describe 'part 2' do
    it 'returns nil for the example input' do
      expect(described_class.part_2(example_input)).to eq(nil)
    end

    # it 'returns nil for my input' do
    #   expect(described_class.part_2(input)).to eq(nil)
    # end
  end
end
