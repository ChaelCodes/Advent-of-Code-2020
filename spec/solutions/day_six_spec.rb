require 'spec_helper'
require './solutions/day_six'

RSpec.describe DaySix do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 6911 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 3473 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { ["abc", "a\nb\nc", "ab\nac", "a\na\na\na", "b"] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 11 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 6 }
        end
    end
end