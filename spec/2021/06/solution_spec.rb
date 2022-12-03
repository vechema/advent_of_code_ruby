# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2021/06/input.txt')) }
  let(:example_input) do
    <<~EOF
      3,4,3,1,2
    EOF
  end

  describe 'part 1' do
    it 'returns 5934 for the example input' do
      expect(described_class.part_1(example_input)).to eq(5934)
    end

    it 'returns 353079 for my input' do
      expect(described_class.part_1(input)).to eq(353_079)
    end
  end

  describe 'part 2' do
    it 'returns 26984457539 for the example input' do
      expect(described_class.part_2(example_input)).to eq(26_984_457_539)
    end

    it 'returns 1605400130036 for my input' do
      expect(described_class.part_2(input)).to eq(1_605_400_130_036)
    end
  end
end
