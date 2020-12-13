require 'spec_helper'
require './solutions/day_nine'

RSpec.describe DayNine do
    let(:instance) { described_class.new(input, part) }
    let(:input) { [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576] }

    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 104054607 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 13935797 }
        end
    end

    describe '#process' do
        subject { instance.process }
        before { instance.preamble = 5 }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 127 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 62 }
        end
    end

    describe '#preamble_valid?' do
        subject { instance.preamble_valid? }

        context 'when part 1' do
            let(:part) { 1 }

            context 'with 5 preamble' do
                before { instance.preamble = 5 }

                it { is_expected.to be_truthy }
            end

            context 'with valid input' do
                # 4207 + 7379
                let(:input) { [3317, 4207, 3398, 3816, 5031, 4809, 4062, 4868, 4625, 5667, 5049, 5338, 5163,
                 5587, 5363, 7318, 6506, 5646, 5651, 7405, 5937, 7214, 9874, 6306, 10612, 7379, 11586] }

                it { is_expected.to be_truthy }
            end
        end
    end
end