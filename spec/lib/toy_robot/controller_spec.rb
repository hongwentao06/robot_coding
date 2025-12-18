require "rails_helper"

RSpec.describe ToyRobot::Controller do
  let(:controller) { described_class.new(width: 5, height: 5) }

  describe "#run" do
    it "handles PLACE 0,0,NORTH → MOVE → REPORT" do
      commands = ["PLACE 0,0,NORTH", "MOVE", "REPORT"]

      expect { controller.run(commands) }
        .to output("0, 1, NORTH\n")
        .to_stdout
    end

    it "handles LEFT rotation" do
      commands = ["PLACE 0,0,NORTH", "LEFT", "REPORT"]

      expect { controller.run(commands) }
        .to output("0, 0, WEST\n")
        .to_stdout
    end

    it "handles full complex example" do
      commands = [
        "PLACE 1,2,EAST",
        "MOVE",
        "MOVE",
        "LEFT",
        "MOVE",
        "REPORT"
      ]

      expect { controller.run(commands) }
        .to output("3, 3, NORTH\n")
        .to_stdout
    end

    it "prevents falling off the table" do
      commands = ["PLACE 0,0,SOUTH", "MOVE", "REPORT"]

      expect { controller.run(commands) }
        .to output("0, 0, SOUTH\n")
        .to_stdout
    end
  end
end
