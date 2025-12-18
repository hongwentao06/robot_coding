module ToyRobot
  class CommandReader
    # PLACE command pattern:
    # - \A and \z anchor the match to the entire string (no extra characters allowed)
    # - PLACE followed by one or more spaces
    # - (\d+) captures X coordinate
    # - , separates values
    # - (\d+) captures Y coordinate
    # - , separates values
    # - (north|south|east|west) captures direction (case-insensitive because of /i)
    # This ensures only valid PLACE commands like "PLACE 1,2,NORTH" are matched.
    PLACE_REGEX = /\APLACE\s+(\d+),(\d+),(north|south|east|west)\z/i

    # Design notes:
    # Why did not put an initialize functions here?
    # Initialize is used to set up state
    # But CommandReader nothing to store and no settings
    # It only used to read the command
    def read_command(input)
      return nil if input.nil?

      place_command = input.match(PLACE_REGEX)

      return [:place, { x: place_command[1].to_i, y: place_command[2].to_i, facing: place_command[3].upcase }] if place_command

      case input.upcase
      when "MOVE"
        [:move, {}]
      when "LEFT"
        [:left, {}]
      when "RIGHT"
        [:right, {}]
      when "REPORT"
        [:report, {}]
      else
        nil
      end
    end
  end
end
