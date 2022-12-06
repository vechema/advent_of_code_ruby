# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/06/input.txt')) }
  let(:example_input) do
    <<~EOF
      mjqjpqmgbljsphdztnvjfqwrcgsmlb
    EOF
  end

  describe 'part 1' do
    it 'returns 7 for the example input' do
      expect(described_class.part_1(example_input)).to eq(7)
    end

    it 'returns 1275 for my input' do
      expect(described_class.part_1(input)).to eq(1275)
    end
  end

  describe 'part 2' do
    it 'returns 19 for the example input' do
      expect(described_class.part_2(example_input)).to eq(19)
    end

    it 'returns 3605 for my input' do
      expect(described_class.part_2(input)).to eq(3605)
    end
  end
end
