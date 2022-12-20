# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day19 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/19/input.txt')) }
  let(:example_input) do
    <<~EOF
      Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.
      Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian.
    EOF
  end

  describe 'part 1' do
    # it 'returns 33 for the example input' do
    #   expect(described_class.part_1(example_input)).to eq(33)
    # end

    # SLOW
    # it 'returns 1081 for my input' do
    #   expect(described_class.part_1(input)).to eq(1081)
    # end
  end

  describe 'part 2' do
    # it 'returns nil for the example input' do
    #   expect(described_class.part_2(example_input)).to eq(56 * 62)
    # end

    # SO SLOW
    # it 'returns 2415 for my input' do
    #   expect(described_class.part_2(input)).to eq(2415)
    # end
  end
end
