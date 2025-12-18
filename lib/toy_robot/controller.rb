require_relative "tabletop"
require_relative "robot"
require_relative "command_reader"

module ToyRobot
  class Controller
    def initialize(width:, height:)
      return if width.nil? || height.nil?

      @tabletop = Tabletop.new(width: width, height: height)
      @robot = Robot.new
      @command_reader = CommandReader.new
    end

    def run(inputs)
      inputs.each do |input|
        command = @command_reader.read_command(input)
        next if command.nil?

        action, args = command

        case action
        when :place
          place_robot(args: args)

        when :move
          move_robot

        when :left
          @robot.left

        when :right
          @robot.right

        when :report
          result = @robot.report
          puts result if result
        end
      end
    end


    private

    def place_robot(args:)
      x = args.fetch(:x)
      y = args.fetch(:y)
      facing = args.fetch(:facing)

      return unless @tabletop.valid_position?(x: x, y: y)

      @robot.place(x: x, y: y, facing: facing)
    end

    def move_robot
      return unless @robot.placed?

      result = @robot.next_position
      return unless @tabletop.valid_position?(x: result[:x], y: result[:y])

      @robot.move(**result)
    end
  end
end
