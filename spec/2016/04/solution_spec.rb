# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2016::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2016/04/input.txt')) }
  let(:example_input) do
    <<~EOF
      aaaaa-bbb-z-y-x-123[abxyz]
      a-b-c-d-e-f-g-h-987[abcde]
      not-a-real-room-404[oarel]
      totally-real-room-200[decoy]
      bcfhvdczs-cpxsqh-ghcfous-324[chsfb]
    EOF
  end

  describe 'part 1' do
    it 'returns 1514 for the example input' do
      expect(described_class.part_1(example_input)).to eq(1838)
    end

    it 'returns 245102 for my input' do
      expect(described_class.part_1(input)).to eq(245_102)
    end
  end

  describe 'part 2' do
    it 'returns 324 for the example input' do
      expect(described_class.part_2(example_input)).to eq(324)
    end

    it 'returns 324 for my input' do
      expect(described_class.part_2(input)).to eq(324)
    end
  end
end
