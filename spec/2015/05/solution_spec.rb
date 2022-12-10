# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day05 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/05/input.txt')) }
  let(:example_input) do
    <<~EOF
      ugknbfddgicrmopn
      aaa
      jchzalrnumimnmhp
      haegwjzuvuyypxyu
      dvszwmarrgswjxmb
      qjhvhtzxzqqjkmpb
      xxyxx
      uurcxstgmygtbstg
      ieodomkazucvgmuy
      aabcaa
    EOF
  end

  describe 'part 1' do
    it 'returns 2 for the example input' do
      expect(described_class.part_1(example_input)).to eq(2)
    end

    it 'returns 258 for my input' do
      expect(described_class.part_1(input)).to eq(258)
    end
  end

  describe 'part 2' do
    it 'returns 2 for the example input' do
      expect(described_class.part_2(example_input)).to eq(2)
    end

    it 'returns 53 for my input' do
      expect(described_class.part_2(input)).to eq(53)
    end
  end
end
