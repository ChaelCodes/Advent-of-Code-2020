require 'spec_helper'
require './solutions/day_two'

RSpec.describe DayTwo do
    describe '.run' do
        subject { described_class.run(part) }
    
        context 'when part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 460 }
        end

        context 'when part two' do
            let(:part) { 2 }

            it { is_expected.to eq 0 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }

        context 'sample one' do
            let(:input) { ['1-3 a: abcde',
                           '1-3 b: cdefg',
                           '2-9 c: ccccccccc'] }
            context 'when part 1' do
                let(:part) { 1 }

                it { is_expected.to eq 2 }
            end

            context 'when part 2' do
                let(:part) { 2 }

                it { is_expected.to eq 1 }
            end
        end

        context 'sample two' do
            let(:input) { ['1-3 a: abcde',
                           '1-3 b: cdefg',
                           '2-9 c: ccccccccc'] }
        end
    end

    describe '#valid_password' do
        subject { described_class.new(input, part).valid_password(password) }
        let(:input) { '' }
        let(:password) { '1-3 a: abcde' }

        context 'when part 1' do
            let(:part) { 1 }
            it { is_expected.to be_truthy }

            context 'nonsequential characters' do
                let(:password) { '2-3 a: abcdea' }

                it { is_expected.to be_truthy }
            end

            context 'nonmatching password' do
                let(:password) { '1-3 b: cdefg' }

                it { is_expected.to be_falsey }
            end

            context 'double digit numbers' do
                let(:password) { '15-17 c: sccccccgccccccccc' }

                it { is_expected.to be_truthy }
            end

            context 'weird looking one' do
                let(:password) { '1-11 t: tfvtqvlbtld' }

                it { is_expected.to be_truthy }
            end
        end

        context 'when part 2' do
            let(:part) { 2 }
            let(:password) { '1-3 a: abcde' }

            it { is_expected.to be_truthy }
        end
    end
end