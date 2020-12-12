require 'spec_helper'
require './solutions/day_nine'

RSpec.describe DayNine do
    let(:instance) { described_class.new(input, part) }
    let(:input) { [] }

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
        subject { instance.process }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 'hello' }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end
end