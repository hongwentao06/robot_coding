require "rails_helper"

RSpec.describe ToyRobot::Tabletop do
  let(:tabletop) { described_class.new(width: 5, height: 5) }

  describe "#valid_position?" do
    it "returns true for positions inside boundaries" do
      expect(tabletop.valid_position?(x: 0, y: 0)).to be true
      expect(tabletop.valid_position?(x: 4, y: 4)).to be true
    end

    it "returns false for positions outside boundaries" do
      expect(tabletop.valid_position?(x: -1, y: 0)).to be false
      expect(tabletop.valid_position?(x: 0, y: -1)).to be false
      expect(tabletop.valid_position?(x: 5, y: 0)).to be false
      expect(tabletop.valid_position?(x: 0, y: 5)).to be false
    end
  end
end
