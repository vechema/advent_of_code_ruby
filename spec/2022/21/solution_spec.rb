# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2022::Day21 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2022/21/input.txt')) }
  let(:example_input) do
    <<~EOF
      root: pppw + sjmn
      dbpl: 5
      cczh: sllz + lgvd
      zczc: 2
      ptdq: humn - dvpt
      dvpt: 3
      lfqf: 4
      humn: 5
      ljgn: 2
      sjmn: drzm * dbpl
      sllz: 4
      pppw: cczh / lfqf
      lgvd: ljgn * ptdq
      drzm: hmdt - zczc
      hmdt: 32
    EOF
  end

  describe 'part 1' do
    it 'returns 152 for the example input' do
      expect(described_class.part_1(example_input)).to eq(152)
    end

    it 'returns 121868120894282 for my input' do
      expect(described_class.part_1(input)).to eq(121_868_120_894_282)
    end
  end

  describe 'part 2' do
    it 'returns 301 for the example input' do
      expect(described_class.part_2(example_input)).to eq(301)
    end

    it 'returns 3582317956029 for my input' do
      expect(described_class.part_2(input)).to eq(3_582_317_956_029)
    end
  end
end
