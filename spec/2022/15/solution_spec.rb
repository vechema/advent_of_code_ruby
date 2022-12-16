# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day15 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/15/input.txt')) }
  let(:example_input) do
    <<~EOF
      Sensor at x=2, y=18: closest beacon is at x=-2, y=15
      Sensor at x=9, y=16: closest beacon is at x=10, y=16
      Sensor at x=13, y=2: closest beacon is at x=15, y=3
      Sensor at x=12, y=14: closest beacon is at x=10, y=16
      Sensor at x=10, y=20: closest beacon is at x=10, y=16
      Sensor at x=14, y=17: closest beacon is at x=10, y=16
      Sensor at x=8, y=7: closest beacon is at x=2, y=10
      Sensor at x=2, y=0: closest beacon is at x=2, y=10
      Sensor at x=0, y=11: closest beacon is at x=2, y=10
      Sensor at x=20, y=14: closest beacon is at x=25, y=17
      Sensor at x=17, y=20: closest beacon is at x=21, y=22
      Sensor at x=16, y=7: closest beacon is at x=15, y=3
      Sensor at x=14, y=3: closest beacon is at x=15, y=3
      Sensor at x=20, y=1: closest beacon is at x=15, y=3
    EOF
  end

  describe 'part 1' do
    it 'returns 26 for the example input' do
      expect(described_class.part_1(example_input)).to eq(26)
    end

    # SLOW
    # it 'returns 4724228 for my input' do
    #   expect(described_class.part_1(input)).to eq(4_724_228)
    # end
  end

  describe 'part 2' do
    # it 'returns 56000011 for the example input' do
    #   expect(described_class.part_2(example_input)).to eq(56_000_011)
    # end

    it 'returns 13622251246513 for my input' do
      expect(described_class.part_2(input)).to eq(13_622_251_246_513)
    end
  end
end
