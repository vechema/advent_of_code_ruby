# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Year2021::Day01 do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2021/01/input.txt")) }
  let(:example_input) {
    <<~EOF
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    EOF
  }

  describe "part 1" do
    it "returns 7 for the example input" do
      expect(described_class.part_1(example_input)).to eq(7)
    end

    it "returns 1696 for my input" do
      expect(described_class.part_1(input)).to eq(1696)
    end
  end

  describe "part 2" do
    it "returns 5 for the example input" do
      expect(described_class.part_2(example_input)).to eq(5)
    end

    it "returns 1737 for my input" do
      expect(described_class.part_2(input)).to eq(1737)
    end
  end
end
