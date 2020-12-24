require 'spec_helper'
require './solutions/day_ten'

RSpec.describe DayTen do
    let(:instance) { described_class.new(input, part) }
    let(:input) { [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4] }

    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 2516 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 296196766695424 }
        end
    end

    describe '#process' do
        subject { instance.process }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 35 }

            context 'longer input' do
                let(:input) { [28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23, 49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8, 17, 7, 9, 4, 2, 34, 10, 3] }

                it { is_expected.to eq 220 }
            end
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 8 }

            context 'longer input' do
                let(:input) { [28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23, 49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8, 17, 7, 9, 4, 2, 34, 10, 3] }

                it { is_expected.to eq 19208 }
            end
        end
    end

    describe '#convert_to_arrangements' do
        subject { instance.convert_to_arrangements(repeats) }
        let(:part) { 2 }

        context 'repeats' do
            let(:repeats) { 1 }
            it { is_expected.to eq 1 }
        end
        context 'repeats' do
            let(:repeats) { 2 }
            it { is_expected.to eq 2 }
        end
        context 'repeats' do
            let(:repeats) { 3 }
            it { is_expected.to eq 4 }
        end
        context 'repeats' do
            let(:repeats) { 4 } # -1 (1) 2**4 - 2**3 -1
            it { is_expected.to eq 7 }
        end
        context 'repeats' do
            let(:repeats) { 5 } # -3 (1) 2**5 - 2**4 -3, 2**4 - 2**1 -1
            it { is_expected.to eq 13 }
        end
        context 'repeats' do
            let(:repeats) { 6 } # -10 (2) 2**5 - 2**3 -2
            it { is_expected.to eq 22 }
        end
    end
end