# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    EOF
  end

  describe 'part 1' do
    it 'returns 157 for the example input' do
      expect(described_class.part_1(example_input)).to eq(157)
    end

    it 'returns 7997 for my input' do
      expect(described_class.part_1(input)).to eq(7997)
    end
  end

  describe 'part 2' do
    it 'returns 70 for the example input' do
      expect(described_class.part_2(example_input)).to eq(70)
    end

    it 'returns 2545 for my input' do
      expect(described_class.part_2(input)).to eq(2545)
    end
  end
end
