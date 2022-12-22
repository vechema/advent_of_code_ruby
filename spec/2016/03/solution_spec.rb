# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2016::Day03 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2016/03/input.txt')) }
  let(:example_input) do
    <<~EOF
      330  143  338
      769  547   83
      930  625  317
      669  866  147
       15  881  210
      662   15   70
    EOF
  end

  describe 'part 1' do
    it 'returns 2 for the example input' do
      expect(described_class.part_1(example_input)).to eq(2)
    end

    it 'returns 917 for my input' do
      expect(described_class.part_1(input)).to eq(917)
    end
  end

  describe 'part 2' do
    it 'returns 5 for the example input' do
      expect(described_class.part_2(example_input)).to eq(5)
    end

    it 'returns 1649 for my input' do
      expect(described_class.part_2(input)).to eq(1649)
    end
  end
end
