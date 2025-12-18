module ToyRobot
  class Robot
    DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

    # Design notes:
    # Why expose x, y, and facing with attr_reader if report already returns them?
    # This provides flexibility for future features that may need direct access
    # to the robot's state without relying on string parsing.
    attr_reader :x, :y, :facing

    def initialize
      @x = nil
      @y = nil
      @facing = nil
    end

    def place(x: , y:, facing:)
      return false unless DIRECTIONS.include?(facing)

      @x = x
      @y = y
      @facing = facing
      @facing_index = DIRECTIONS.index(facing)

      true
    end

    def placed?
      [x, y, facing].all?
    end

    def left
      return false unless placed?

      new_index = facing_index - 1
      @facing = if new_index >= 0
                  DIRECTIONS[new_index]
                else
                  DIRECTIONS.last
                end
    end

    def right
      return false unless placed?

      new_index = facing_index + 1
      @facing = if new_index < DIRECTIONS.length
                  DIRECTIONS[new_index]
                else
                  DIRECTIONS.first
                end
    end


    def next_position
      return unless placed?

      case facing
      when "NORTH"
        { x: x, y: y + 1 }
      when "EAST"
        { x: x + 1, y: y }
      when "SOUTH"
        { x: x, y: y - 1 }
      when "WEST"
        { x: x - 1, y: y }
      end


    end

    def move(x:, y:)
      return unless placed?

      @x = x
      @y = y
    end

    def report
      return unless placed?

      "#{x}, #{y}, #{facing}"
    end

    private

    def facing_index
      DIRECTIONS.index(facing)
    end
  end
end
