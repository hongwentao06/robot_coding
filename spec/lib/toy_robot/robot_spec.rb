require "rails_helper"

RSpec.describe ToyRobot::Robot do
  let(:robot) { described_class.new }

  describe "#placed?" do
    it "is false initially" do
      expect(robot.placed?).to be false
      expect(robot.report).to be_nil
    end

    it "is true after placing" do
      robot.place(x: 1, y: 2, facing: "NORTH")
      expect(robot.placed?).to be true
      expect(robot.report).to eq("1, 2, NORTH")
    end
  end

  describe "#next_position" do
    before { robot.place(x: 1, y: 1, facing: facing) }

    context "facing NORTH" do
      let(:facing) { "NORTH" }
      it { expect(robot.next_position).to eq(x: 1, y: 2) }
    end

    context "facing SOUTH" do
      let(:facing) { "SOUTH" }
      it { expect(robot.next_position).to eq(x: 1, y: 0) }
    end

    context "facing EAST" do
      let(:facing) { "EAST" }
      it { expect(robot.next_position).to eq(x: 2, y: 1) }
    end

    context "facing WEST" do
      let(:facing) { "WEST" }
      it { expect(robot.next_position).to eq(x: 0, y: 1) }
    end
  end

  describe "#left / #right" do
    before { robot.place(x: 0, y: 0, facing: "NORTH") }

    it "rotates left correctly" do
      robot.left
      expect(robot.facing).to eq("WEST")
    end

    it "rotates right correctly" do
      robot.right
      expect(robot.facing).to eq("EAST")
    end
  end
end
