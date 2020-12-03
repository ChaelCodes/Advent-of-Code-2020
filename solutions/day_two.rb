class DayTwo
    FILE_INPUT = "./inputs/day_two.txt"

    def initialize(input, part)
        @input = input
        @part = part
    end

    def process
        @input.count { |password| valid_password(password) }
    end

    def valid_password(password)
        parsed_pword = password.match(/(?<min>\d+)-(?<max>\d+) (?<match>\w): (?<password>\w+)/)
        min, max, match, password = parsed_pword[:min].to_i, parsed_pword[:max].to_i, parsed_pword[:match], parsed_pword[:password]
        
        if (@part == 1)
            count = password.count(match)
            count >= min && count <= max
            # parsed_pword[:password].match?(/(?=(?:[^#{match}]*[#{match}][^#{match}]*){#{min},#{max}})/)
            # parsed_pword[:password].match?(/[^#{match}]*(#{match}[^#{match}]*){#{min},#{max}}/)
        else
            char_1 = password[min - 1]
            char_2 = password[max - 1]
            [char_1, char_2].include?(match) && char_1 != char_2
        end
    end

    def self.run(part)
        file = File.read(FILE_INPUT)
        array = file.split("\n")
        DayTwo.new(array, part).process
    end
end