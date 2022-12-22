# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2016::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2016/01/input.txt')) }
  let(:example_input) do
    <<~EOF
      R8, R4, R4, R8
    EOF
  end

  describe 'part 1' do
    it 'returns 12 for the example input' do
      expect(described_class.part_1(example_input)).to eq(8)
    end

    it 'returns 301 for my input' do
      expect(described_class.part_1(input)).to eq(301)
    end
  end

  describe 'part 2' do
    it 'returns 4 for the example input' do
      expect(described_class.part_2(example_input)).to eq(4)
    end

    # 124
    it 'returns 130 for my input' do
      expect(described_class.part_2(input)).to eq(130)
    end
  end
end
