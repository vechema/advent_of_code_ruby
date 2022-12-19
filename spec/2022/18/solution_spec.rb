# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day18 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/18/input.txt')) }
  let(:example_input) do
    <<~EOF
      2,2,2
      1,2,2
      3,2,2
      2,1,2
      2,3,2
      2,2,1
      2,2,3
      2,2,4
      2,2,6
      1,2,5
      3,2,5
      2,1,5
      2,3,5
    EOF
  end

  describe 'part 1' do
    it 'returns 64 for the example input' do
      expect(described_class.part_1(example_input)).to eq(64)
    end

    # SLOW
    # it 'returns 4604 for my input' do
    #   expect(described_class.part_1(input)).to eq(4604)
    # end
  end

  describe 'part 2' do
    it 'returns 58 for the example input' do
      expect(described_class.part_2(example_input)).to eq(58)
    end

    # SLOW
    # it 'returns 2604 for my input' do
    #   expect(described_class.part_2(input)).to eq(2604)
    # end
  end
end
