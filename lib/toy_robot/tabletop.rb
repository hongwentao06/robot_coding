module ToyRobot
  class Tabletop
    def initialize(width:, height:)
      @width = width
      @height = height
    end

    # Design notes:
    # Should valid_position? be inside Robot?
    # No. The Tabletop owns the boundary rules and determines whether a position is valid.
    # The Robot should not know the board size; it only performs movement, rotation, and reporting.
    def valid_position?(x:, y:)
      x.between?(0, @width - 1) && y.between?(0, @height - 1)
    end
  end
end
