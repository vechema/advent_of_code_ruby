# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Year2015::Day04 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), '../../../challenges/2015/04/input.txt')) }
  let(:example_input) do
    <<~EOF
      abcdef
    EOF
  end

  # These tests are really slow so commenting them out
  describe 'part 1' do
    # it 'returns 609043 for the example input' do
    #   expect(described_class.part_1(example_input)).to eq(609_043)
    # end

    # it 'returns 117946 for my input' do
    #   expect(described_class.part_1(input)).to eq(117_946)
    # end
  end

  describe 'part 2' do
    # it 'returns 6742839 for the example input' do
    #   expect(described_class.part_2(example_input)).to eq(6_742_839)
    # end

    # it 'returns 3938038 for my input' do
    #   expect(described_class.part_2(input)).to eq(3_938_038)
    # end
  end
end
