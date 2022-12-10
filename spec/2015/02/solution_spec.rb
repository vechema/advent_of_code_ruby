# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/02/input.txt')) }
  let(:example_input) do
    <<~EOF
      2x3x4
      1x1x10
    EOF
  end

  describe 'part 1' do
    it 'returns 111 for the example input' do
      expect(described_class.part_1(example_input)).to eq(101)
    end

    it 'returns 1586300 for my input' do
      expect(described_class.part_1(input)).to eq(1_586_300)
    end
  end

  describe 'part 2' do
    it 'returns 48 for the example input' do
      expect(described_class.part_2(example_input)).to eq(48)
    end

    it 'returns 3737498 for my input' do
      expect(described_class.part_2(input)).to eq(3_737_498)
    end
  end
end
