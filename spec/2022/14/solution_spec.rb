# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day14 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/14/input.txt')) }
  let(:example_input) do
    <<~EOF
      498,4 -> 498,6 -> 496,6
      503,4 -> 502,4 -> 502,9 -> 494,9
    EOF
  end

  describe 'part 1' do
    it 'returns 24 for the example input' do
      expect(described_class.part_1(example_input)).to eq(24)
    end

    it 'returns 832 for my input' do
      expect(described_class.part_1(input)).to eq(832)
    end
  end

  describe 'part 2' do
    it 'returns 93 for the example input' do
      expect(described_class.part_2(example_input)).to eq(93)
    end

    # SLOW
    # it 'returns 27601 for my input' do
    #   expect(described_class.part_2(input)).to eq(27_601)
    # end
  end
end
