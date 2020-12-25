require 'spec_helper'
require './solutions/day_eleven'

RSpec.describe DayEleven do
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

    let(:input) { %w[hello] }
    describe '#process' do
        subject { described_class.new(input, part).process }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 'hello' }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end
end