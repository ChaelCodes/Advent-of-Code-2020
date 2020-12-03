require 'spec_helper'
require './solutions/day_three'

RSpec.describe DayThree do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 'hello' }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end

    describe '#process' do
        subject { described_class.run(part).process }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 'hello' }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end
end