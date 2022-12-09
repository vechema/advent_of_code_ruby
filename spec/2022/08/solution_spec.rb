# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day08 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/08/input.txt')) }
  let(:example_input) do
    <<~EOF
      30373
      25512
      65332
      33549
      35390
    EOF
  end

  describe 'part 1' do
    it 'returns 21 for the example input' do
      expect(described_class.part_1(example_input)).to eq(21)
    end

    it 'returns 1776 for my input' do
      expect(described_class.part_1(input)).to eq(1776)
    end
  end

  describe 'part 2' do
    it 'returns 8 for the example input' do
      expect(described_class.part_2(example_input)).to eq(8)
    end

    it 'returns 234416 for my input' do
      expect(described_class.part_2(input)).to eq(234_416)
    end
  end
end
