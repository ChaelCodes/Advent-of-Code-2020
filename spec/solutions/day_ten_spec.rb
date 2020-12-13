require 'spec_helper'
require './solutions/day_ten'

RSpec.describe DayTen do
    let(:instance) { described_class.new(input, part) }
    let(:input) { [] }

    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }

        end

        context 'when part 2' do
            let(:part) { 2 }

        end
    end

    describe '#process' do
        subject { instance.process }

        context 'part 1' do
            let(:part) { 1 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end
end