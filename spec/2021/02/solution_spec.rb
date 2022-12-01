# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day02 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2021/02/input.txt')) }
  let(:example_input) do
    <<~EOF
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    EOF
  end

  describe 'part 1' do
    it 'returns 150 for the example input' do
      expect(described_class.part_1(example_input)).to eq(150)
    end

    it 'returns 1648020 for my input' do
      expect(described_class.part_1(input)).to eq(1_648_020)
    end
  end

  describe 'part 2' do
    it 'returns 900 for the example input' do
      expect(described_class.part_2(example_input)).to eq(900)
    end

    it 'returns 1759818555 for my input' do
      expect(described_class.part_2(input)).to eq(1_759_818_555)
    end
  end
end
