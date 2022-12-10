# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day06 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/06/input.txt')) }
  let(:example_input) do
    <<~EOF
      turn on 0,0 through 0,9
      turn off 0,5 through 0,7
      toggle 0,3 through 0,6
      turn on 0,0 through 9,0
      turn off 3,0 through 8,0
      toggle 2,0 through 6,0
      turn on 2,2 through 4,4
      toggle 3,3 through 5,5
    EOF
  end

  describe 'part 1' do
    it 'returns 23 for the example input' do
      expect(described_class.part_1(example_input)).to eq(23)
    end

    # SLOW
    # it 'returns 543903 for my input' do
    #   expect(described_class.part_1(input)).to eq(543_903)
    # end
  end

  describe 'part 2' do
    it 'returns 56 for the example input' do
      expect(described_class.part_2(example_input)).to eq(56)
    end

    # SLOW
    # it 'returns 14687245 for my input' do
    #   expect(described_class.part_2(input)).to eq(14_687_245)
    # end
  end
end
