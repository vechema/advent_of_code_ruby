# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day17 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/17/input.txt')) }
  let(:example_input) do
    <<~EOF
      >>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>
    EOF
  end

  describe 'part 1' do
    it 'returns 3068 for the example input' do
      expect(described_class.part_1(example_input)).to eq(3068)
    end

    # SLOW
    # it 'returns 3206 for my input' do
    #   expect(described_class.part_1(input)).to eq(3206)
    # end
  end

  describe 'part 2' do
    it 'returns 1514285714288 for the example input' do
      expect(described_class.part_2(example_input)).to eq(1_514_285_714_288)
    end

    # SLOW
    # it 'returns 1602881844347 for my input' do
    #   expect(described_class.part_2(input)).to eq(1_602_881_844_347)
    # end
  end
end
