require 'spec_helper'
require './solutions/day_eight'

RSpec.describe DayEight do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 0 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { %w[hello] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 0 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end
end