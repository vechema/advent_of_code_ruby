# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2016::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2016/02/input.txt')) }
  let(:example_input) do
    <<~EOF
      ULL
      RRDDD
      LURDL
      UUUUD
    EOF
  end

  describe 'part 1' do
    it 'returns 1985 for the example input' do
      expect(described_class.part_1(example_input)).to eq(1985)
    end

    it 'returns 97289 for my input' do
      expect(described_class.part_1(input)).to eq(97_289)
    end
  end

  describe 'part 2' do
    it 'returns 5DB3 for the example input' do
      expect(described_class.part_2(example_input)).to eq('5DB3')
    end

    it 'returns 9A7DC for my input' do
      expect(described_class.part_2(input)).to eq('9A7DC')
    end
  end
end
