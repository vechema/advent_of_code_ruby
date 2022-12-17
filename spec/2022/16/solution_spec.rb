# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day16 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/16/input.txt')) }
  let(:example_input) do
    <<~EOF
      Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
      Valve BB has flow rate=13; tunnels lead to valves CC, AA
      Valve CC has flow rate=2; tunnels lead to valves DD, BB
      Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
      Valve EE has flow rate=3; tunnels lead to valves FF, DD
      Valve FF has flow rate=0; tunnels lead to valves EE, GG
      Valve GG has flow rate=0; tunnels lead to valves FF, HH
      Valve HH has flow rate=22; tunnel leads to valve GG
      Valve II has flow rate=0; tunnels lead to valves AA, JJ
      Valve JJ has flow rate=21; tunnel leads to valve II
    EOF
  end

  describe 'part 1' do
    it 'returns 1651 for the example input' do
      expect(described_class.part_1(example_input)).to eq(1651)
    end

    # it 'returns 1728 for my input' do
    #   expect(described_class.part_1(input)).to eq(1728)
    # end
  end

  describe 'part 2' do
    it 'returns 1707 for the example input' do
      expect(described_class.part_2(example_input)).to eq(1707)
    end

    # SLOW - 3 minutes!!
    # it 'returns 2304 for my input' do
    #   expect(described_class.part_2(input)).to eq(2304)
    # end
  end
end
