# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day20 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/20/input.txt')) }
  let(:example_input) do
    <<~EOF
      1
      2
      -3
      3
      -2
      0
      4
    EOF
  end

  describe 'part 1' do
    it 'returns 3 for the example input' do
      expect(described_class.part_1(example_input)).to eq(3)
    end

    # SLOW
    # it 'returns 3700 for my input' do
    #   expect(described_class.part_1(input)).to eq(3700)
    # end
  end

  describe 'part 2' do
    it 'returns 1623178306 for the example input' do
      expect(described_class.part_2(example_input)).to eq(1_623_178_306)
    end

    # SLOW
    # it 'returns 10626948369382 for my input' do
    #   expect(described_class.part_2(input)).to eq(10_626_948_369_382)
    # end
  end
end
