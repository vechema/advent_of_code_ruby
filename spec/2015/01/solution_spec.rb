# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/01/input.txt')) }
  let(:example_input) do
    <<~EOF
      ))(((((
    EOF
  end

  describe 'part 1' do
    it 'returns 3 for the example input' do
      expect(described_class.part_1(example_input)).to eq(3)
    end

    it 'returns 232 for my input' do
      expect(described_class.part_1(input)).to eq(232)
    end
  end

  describe 'part 2' do
    it 'returns 1 for the example input' do
      expect(described_class.part_2(example_input)).to eq(1)
    end

    it 'returns 1783 for my input' do
      expect(described_class.part_2(input)).to eq(1783)
    end
  end
end
