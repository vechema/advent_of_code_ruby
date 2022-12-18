# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day08 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/08/input.txt')) }
  let(:example_input) do
    <<~EOF
      ""
      "abc"
      "aaa\\"aaa"
      "\\x27"
      "\\\\"
    EOF
  end

  describe 'part 1' do
    it 'returns 15 for the example input' do
      expect(described_class.part_1(example_input)).to eq(15)
    end

    it 'returns 1333 for my input' do
      expect(described_class.part_1(input)).to eq(1333)
    end
  end

  describe 'part 2' do
    it 'returns 25 for the example input' do
      expect(described_class.part_2(example_input)).to eq(25)
    end

    it 'returns 2046 for my input' do
      expect(described_class.part_2(input)).to eq(2046)
    end
  end
end
