# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2021::Day10 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2021/10/input.txt')) }
  let(:example_input) do
    <<~EOF
      [({(<(())[]>[[{[]{<()<>>
      [(()[<>])]({[<{<<[]>>(
      {([(<{}[<>[]}>{[]{[(<()>
      (((({<>}<{<{<>}{[]{[]{}
      [[<[([]))<([[{}[[()]]]
      [{[{({}]{}}([{[{{{}}([]
      {<[[]]>}<{[{[{[]{()[[[]
      [<(<(<(<{}))><([]([]()
      <{([([[(<>()){}]>(<<{{
      <{([{{}}[<[[[<>{}]]]>[]]
    EOF
  end

  describe 'part 1' do
    it 'returns 26397 for the example input' do
      expect(described_class.part_1(example_input)).to eq(26_397)
    end

    it 'returns 319329 for my input' do
      expect(described_class.part_1(input)).to eq(319_329)
    end
  end

  describe 'part 2' do
    it 'returns 288957 for the example input' do
      expect(described_class.part_2(example_input)).to eq(288_957)
    end

    it 'returns 3515583998 for my input' do
      expect(described_class.part_2(input)).to eq(3_515_583_998)
    end
  end
end
