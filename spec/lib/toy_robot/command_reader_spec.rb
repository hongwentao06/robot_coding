require "rails_helper"

RSpec.describe ToyRobot::CommandReader do
  let(:reader) { described_class.new }

  describe "#read_command" do
    it "parses a PLACE command" do
      cmd = reader.read_command("PLACE 1,2,NORTH")
      expect(cmd).to eq([:place, { x: 1, y: 2, facing: "NORTH" }])
    end

    it "parses MOVE command" do
      expect(reader.read_command("MOVE")).to eq([:move, {}])
    end

    it "parses LEFT command" do
      expect(reader.read_command("LEFT")).to eq([:left, {}])
    end

    it "parses RIGHT command" do
      expect(reader.read_command("RIGHT")).to eq([:right, {}])
    end

    it "parses REPORT command" do
      expect(reader.read_command("REPORT")).to eq([:report, {}])
    end

    it "returns nil for invalid commands" do
      expect(reader.read_command("JUMP")).to be_nil
      expect(reader.read_command("")).to be_nil
    end
  end
end
