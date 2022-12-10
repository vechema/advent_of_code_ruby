# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day07 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/07/input.txt')) }
  let(:example_input) do
    <<~EOF
      i -> a
      x AND b -> d
      x OR b -> e
      x LSHIFT 2 -> f
      b RSHIFT 2 -> g
      NOT x -> h
      NOT b -> i
      123 -> x
      456 -> b
    EOF
  end

  describe 'part 1' do
    it 'returns 65079 for the example input' do
      expect(described_class.part_1(example_input)).to eq(65_079)
    end

    it 'returns 3176 for my input' do
      expect(described_class.part_1(input)).to eq(3176)
    end
  end

  describe 'part 2' do
    it 'returns 456 for the example input' do
      expect(described_class.part_2(example_input)).to eq(456)
    end

    it 'returns 14710 for my input' do
      expect(described_class.part_2(input)).to eq(14_710)
    end
  end
end
