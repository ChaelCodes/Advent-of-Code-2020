require 'spec_helper'
require './solutions/day_eleven'

RSpec.describe DayEleven do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 2427 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end

    let(:input) { %w[L.LL.LL.LL
        LLLLLLL.LL
        L.L.L..L..
        LLLL.LL.LL
        L.LL.LL.LL
        L.LLLLL.LL
        ..L.L.....
        LLLLLLLLLL
        L.LLLLLL.L
        L.LLLLL.LL] }
    let(:part) { 1 }

    describe '#process' do
        subject { described_class.new(input, part).process }

        context 'part 1' do
            let(:part) { 1 }

            it { is_expected.to eq 37 }
        end

        context 'when part 2' do
            let(:part) { 2 }
        end
    end

    describe '#process_seat_map' do
        let(:instance) { described_class.new(input, part) }
        subject { instance.process_seat_map }

        it 'updates the seat map' do
            subject
           expect(instance.input).to eq %w[#.##.##.##
            #######.##
            #.#.#..#..
            ####.##.##
            #.##.##.##
            #.#####.##
            ..#.#.....
            ##########
            #.######.#
            #.#####.##]
        end

        context 'second round' do
            let(:input) { %w[#.##.##.##
                #######.##
                #.#.#..#..
                ####.##.##
                #.##.##.##
                #.#####.##
                ..#.#.....
                ##########
                #.######.#
                #.#####.##] }

            
            it 'updates the seat map' do
                subject
                expect(instance.input).to eq %w[#.LL.L#.##
                    #LLLLLL.L#
                    L.L.L..L..
                    #LLL.LL.L#
                    #.LL.LL.LL
                    #.LLLL#.##
                    ..L.L.....
                    #LLLLLLLL#
                    #.LLLLLL.L
                    #.#LLLL.##]
            end
        end
    end

    describe '#seat_transformation' do
        subject { described_class.new(input, part).seat_transformation(x, y) }
        
        context 'first seat' do
            let(:x) { 0 }
            let(:y) { 0 }

            it { is_expected.to eq 1 }
        end
    end

    describe '#count_neighbors' do
        subject { described_class.new(input, part).count_neighbors(x, y) }
        
        context 'first seat' do
            let(:x) { 0 }
            let(:y) { 0 }
            let(:input) { %w[L.LL.LL.L#] }

            it { is_expected.to eq 0 }
        end

        context 'occupied seat' do
            let(:input) { %w[#.LL.L#.##
                             #LLLLLL.L#
                             L.L.L..L..] }
            let(:x) { 1 }
            let(:y) { 1 }

            it { is_expected.to eq 2 }
        end
    end
end