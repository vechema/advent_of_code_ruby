# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day12 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2021/12/input.txt')) }
  let(:example_input1) do
    <<~EOF
      start-A
      start-b
      A-c
      A-b
      b-d
      A-end
      b-end
    EOF
  end
  let(:example_input2) do
    <<~EOF
      dc-end
      HN-start
      start-kj
      dc-start
      dc-HN
      LN-dc
      HN-end
      kj-sa
      kj-HN
      kj-dc
    EOF
  end

  describe 'part 1' do
    it 'returns 10 for the example1 input' do
      expect(described_class.part_1(example_input1)).to eq(10)
    end

    it 'returns 19 for the example2 input' do
      expect(described_class.part_1(example_input2)).to eq(19)
    end

    it 'returns 4659 for my input' do
      expect(described_class.part_1(input)).to eq(4659)
    end
  end

  describe 'part 2' do
    it 'returns 36 for the example1 input' do
      expect(described_class.part_2(example_input1)).to eq(36)
    end

    it 'returns 103 for the example1 input' do
      expect(described_class.part_2(example_input2)).to eq(103)
    end

    # Takes ~7 seconds to run so commenting it out
    # it 'returns 148962 for my input' do
    #   expect(described_class.part_2(input)).to eq(148_962)
    # end
  end
end
