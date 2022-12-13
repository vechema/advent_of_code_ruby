# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day12 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/12/input.txt')) }
  let(:example_input) do
    <<~EOF
      Sabqponm
      abcryxxl
      accszExk
      acctuvwj
      abdefghi
    EOF
  end

  describe 'part 1' do
    it 'returns 31 for the example input' do
      expect(described_class.part_1(example_input)).to eq(31)
    end

    # SLOW
    # it 'returns 484 for my input' do
    #   expect(described_class.part_1(input)).to eq(484)
    # end
  end

  describe 'part 2' do
    it 'returns 29 for the example input' do
      expect(described_class.part_2(example_input)).to eq(29)
    end

    # SLOW
    # it 'returns 478 for my input' do
    #   expect(described_class.part_2(input)).to eq(478)
    # end
  end
end
