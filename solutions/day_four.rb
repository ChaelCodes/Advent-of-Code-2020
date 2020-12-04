require_relative 'solution'
require 'pry'

class DayFour
    include Solution
    FILE_SPLIT = "\n\n"
    FILE_INPUT = "./inputs/day_four.txt"
    VALID_KEYS = %w[byr iyr eyr hgt hcl ecl pid].freeze
    EYE_COLOR = %w[amb blu brn gry grn hzl oth].freeze

    def process
        @input.count do |passport|
            valid_passport?(passport)
        end
    end
    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    # hgt (Height) - a number followed by either cm or in:
    # If cm, the number must be at least 150 and at most 193.
    # If in, the number must be at least 59 and at most 76.
    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    # cid (Country ID) - ignored, missing or not.
    def valid_passport?(passport)
        matches = passport.scan(/(?<key>\w+):(?<value>#?\w+)\s*/)
        passport = matches.to_h
        missing_keys = VALID_KEYS - passport.keys
        return missing_keys.empty? if @part == 1 || missing_keys.any?
        return passport['byr'].to_i.between?(1920, 2002) &&
            passport['iyr'].to_i.between?(2010, 2020) &&
            passport['eyr'].to_i.between?(2020, 2030) &&
            validate_height(passport['hgt']) &&
            passport['hcl'].match?(/\A#[0-9a-f]{6}\z/) &&
            EYE_COLOR.include?(passport['ecl']) &&
            passport['pid'].match?(/\A\d{9}\z/)

    end

    def validate_height(height)
        match = height.match(/\A(?<tall>\d+)(?<unit>(cm|in))\z/)
        return false unless match
        tall, unit = match[:tall].to_i, match[:unit]
        return tall.between?(150, 193) if unit =='cm'
        tall.between?(59, 76)
    end
end