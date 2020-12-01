require 'spec_helper'
require './solutions/day_one'

RSpec.describe DayOne do
    describe '.run' do
        subject { DayOne.run(part) }
    
        context 'when part 1' do
            let(:part) { 1 }

            it 'calls process on an array of numbers' do
                is_expected.to eq 605364
            end
        end

        context 'when part two' do
            let(:part) { 2 }

            it 'finds 3 numbers that sum to 2020' do
                is_expected.to eq 128397680
            end
        end
    end

    describe '#process' do
        subject { DayOne.new(input, set).process }

        context 'sample one' do
            let(:input) { [1721, 979, 366, 299, 675, 1456] }
            let(:set) { 2 }

            it { is_expected.to eq 514579 }
        end

        context 'sample two' do
            let(:input) { [1721, 979, 366, 299, 675, 1456] }
            let(:set) { 3 }

            it { is_expected.to eq 241861950 }
        end
    end
end