# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      ^>v<
    EOF
  end

  describe 'part 1' do
    it 'returns 4 for the example input' do
      expect(described_class.part_1(example_input)).to eq(4)
    end

    it 'returns 2572 for my input' do
      expect(described_class.part_1(input)).to eq(2572)
    end
  end

  describe 'part 2' do
    it 'returns 3 for the example input' do
      expect(described_class.part_2(example_input)).to eq(3)
    end

    it 'returns 2631 for my input' do
      expect(described_class.part_2(input)).to eq(2631)
    end
  end
end
