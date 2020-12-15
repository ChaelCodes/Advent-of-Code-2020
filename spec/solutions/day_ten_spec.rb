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
        end
    end
end