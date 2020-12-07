require 'spec_helper'
require './solutions/day_four'

RSpec.describe DayFour do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 216 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 150 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { ["ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
        byr:1937 iyr:2017 cid:147 hgt:183cm",
        "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
        hcl:#cfa07d byr:1929",
        "hcl:#ae17e1 iyr:2013
        eyr:2024
        ecl:brn pid:760753108 byr:1931
        hgt:179cm",
        "hcl:#cfa07d eyr:2025 pid:166559648
        iyr:2011 ecl:brn hgt:59in"] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 2 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end

    describe '#valid_passport?' do
        subject { described_class.new([], part).valid_passport?(passport) }

        context 'when part 1' do
            let(:part) { 1 }

            context 'example 1' do
                let(:passport) { "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
                byr:1937 iyr:2017 cid:147 hgt:183cm" }

                it { is_expected.to be_truthy }
            end

            context 'invalid passport - missing hgt' do
                let(:passport) { "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
                hcl:#cfa07d byr:1929" }

                it { is_expected.to be_falsey }
            end

            context 'North pole passport' do
                let(:passport) { "hcl:#ae17e1 iyr:2013
                eyr:2024
                ecl:brn pid:760753108 byr:1931
                hgt:179cm" }

                it { is_expected.to be_truthy }
            end

            context 'North pole invalid passport' do
                let(:passport) { "hcl:#cfa07d eyr:2025 pid:166559648
                iyr:2011 ecl:brn hgt:59in" }

                it { is_expected.to be_falsey }
            end
        end

        context 'when part 2' do
            let(:part) { 2 }

            context 'valid passport 1' do
                let(:passport) { "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
                hcl:#623a2f" }

                it { is_expected.to be_truthy }
            end

            context 'valid passport 2' do
                let(:passport) { "eyr:2029 ecl:blu cid:129 byr:1989
                iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm" }

                it { is_expected.to be_truthy }
            end

            context 'valid passport 3' do
                let(:passport) { "hcl:#888785
                hgt:164cm byr:2001 iyr:2015 cid:88
                pid:545766238 ecl:hzl
                eyr:2022" }

                it { is_expected.to be_truthy }
            end

            context 'valid passport 4' do
                let(:passport) { "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719" }

                it { is_expected.to be_truthy }
            end

            context 'invalid passport 1' do
                let(:passport) { "eyr:1972 cid:100
                hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926" }

                it { is_expected.to be_falsey }
            end

            context 'invalid passport 2' do
                let(:passport) { "iyr:2019
                hcl:#602927 eyr:1967 hgt:170cm
                ecl:grn pid:012533040 byr:1946" }

                it { is_expected.to be_falsey }
            end

            context 'invalid passport 3' do
                let(:passport) { "hcl:dab227 iyr:2012
                ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277" }

                it { is_expected.to be_falsey }
            end

            context 'invalid passport 4' do
                let(:passport) { "hgt:59cm ecl:zzz
                eyr:2038 hcl:74454a iyr:2023
                pid:3556412378 byr:2007" }

                it { is_expected.to be_falsey }
            end

            context 'invalid pid' do
                let(:passport) { "iyr:2019
                hcl:#602927 eyr:1967 hgt:170cm
                ecl:grn pid:0123456789 byr:1946" }

                it { is_expected.to be_falsey }
            end

            context 'invalid ecl' do
                let(:passport) { "hcl:#888785
                hgt:164cm byr:2001 iyr:2015 cid:88
                pid:0123456789 ecl:hzl
                eyr:2022" }

                it { is_expected.to be_falsey }
            end
        end
    end

    describe '#validate_height' do
        subject { described_class.new([], 2).validate_height(height) }

        context 'valid height' do
            let(:height) { '151cm' }

            it { is_expected.to be_truthy }
        end

        context 'height without cm' do
            let(:height) { '128' }
            it { is_expected.to be_falsey }
        end

        context 'height over 193' do
            let(:height) { '194cm' }
            it { is_expected.to be_falsey }
        end
    end
end