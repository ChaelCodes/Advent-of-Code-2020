require 'spec_helper'
require './solutions/day_three'

RSpec.describe DayThree do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 207 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 2655892800 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) {
            [
            "..##.......",
            "#...#...#..",
            ".#....#..#.",
            "..#.#...#.#",
            ".#...##..#.",
            "..#.##.....",
            ".#.#.#....#",
            ".#........#",
            "#.##...#...",
            "#...##....#",
            ".#..#...#.#"
            ] }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 7 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 336 }
        end
    end

    describe '#trees_per_slope' do
        subject { described_class.new(input, part).trees_per_slope(x, y) }
        let(:input) {
            [
            "..##.......",
            "#...#...#..",
            ".#....#..#.",
            "..#.#...#.#",
            ".#...##..#.",
            "..#.##.....",
            ".#.#.#....#",
            ".#........#",
            "#.##...#...",
            "#...##....#",
            ".#..#...#.#"
            ] }
        let(:part) { 1 }
        
        context 'when 1,1' do
            let(:x) { 1 }
            let(:y) { 2 }

            it { is_expected.to eq 2 }
        end

        context 'when 3,1' do
            let(:x) { 3 }
            let(:y) { 1 }

            it { is_expected.to eq 7 }
        end

        context 'when 5,1' do
            let(:x) { 5 }
            let(:y) { 1 }

            it { is_expected.to eq 3 }
        end

        context 'when 7,1' do
            let(:x) { 7 }
            let(:y) { 1 }

            it { is_expected.to eq 4 }
        end

        context 'when 1,2' do
            let(:x) { 1 }
            let(:y) { 2 }

            it { is_expected.to eq 2 }
        end
    end
end