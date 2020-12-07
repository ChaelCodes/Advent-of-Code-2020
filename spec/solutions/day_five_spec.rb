require 'spec_helper'
require './solutions/day_five'

RSpec.describe DayFive do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 822 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 705 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { %w[FBFBBFFRLR BFFFBBFRRR FFFBBBFRRR BBFFBBFRLL] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 820 }
        end

        context 'when part 2' do
            let(:part) { 2 }
            let(:input) { %w[FBFBBFFRLR FBFBBFFRLL FBFBBFFRRR] }

            it { is_expected.to eq 358 }
        end
    end

    describe '#seat_location' do
        subject { described_class.new('', 1).seat_location(boarding_pass) }

        context 'with pass 1' do
            let(:boarding_pass) { 'FBFBBFFRLR' }
            it { is_expected.to eq 357 }
        end

        context 'with pass 2' do
            let(:boarding_pass) { 'BFFFBBFRRR' }
            it { is_expected.to eq 567 }
        end

        context 'with pass 3' do
            let(:boarding_pass) { 'FFFBBBFRRR' }
            it { is_expected.to eq 119 }
        end

        context 'with pass 4' do
            let(:boarding_pass) { 'BBFFBBFRLL' }
            it { is_expected.to eq 820 }
        end
    end
end