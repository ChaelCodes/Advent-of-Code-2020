require 'spec_helper'
require './solutions/day_eight'

RSpec.describe DayEight do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 1723 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 846 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { ["nop +0",
                        "acc +1",
                        "jmp +4",
                        "acc +3",
                        "jmp -3",
                        "acc -99",
                        "acc +1",
                        "jmp -4",
                        "acc +6"] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 5 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 8 }
        end
    end

    describe '#find_swap_operations' do
        subject { day_eight.find_swap_operations }
        before { day_eight.find_program_end(day_eight.instructions_called) }

        let(:day_eight) { described_class.new(input, part) }
        let(:input) { ["nop +0",
                        "acc +1",
                        "jmp +4",
                        "acc +3",
                        "jmp -3",
                        "acc -99",
                        "acc +1",
                        "jmp -4",
                        "acc +6"] }
        let(:part) { 2 }

        it { is_expected.to eq [0, 2, 7, 4] }
    end

    describe '#exec' do
        let(:day_eight) { described_class.new(input, part) }
        let(:input) { ["nop +0",
                        "acc +1",
                        "jmp +4",
                        "acc +3",
                        "jmp -3",
                        "acc -99",
                        "acc +1",
                        "jmp -4",
                        "acc +6"] }
        subject { day_eight.exec(line) }
        context 'when part 1' do
            let(:part) { 1 }

            context 'when nop instruction' do
                let(:line) { 0 }

                it 'does nothing' do
                    expect { subject }.to change(day_eight, :index).by(1)
                    expect(day_eight.acc).to eq 0
                end
            end

            context 'when acc instruction' do
                let(:line) { 1 }

                it 'increments acc' do
                    expect { subject }.to change(day_eight, :index).by(1)
                    expect(day_eight.acc).to eq 1
                end

                context 'with negative acc instruction' do
                    let(:line) { 5 }

                    it 'decrements acc' do
                        expect { subject }.to change(day_eight, :index).by(1)
                        expect(day_eight.acc).to eq -99
                    end
                end
            end

            context 'when jmp instruction' do
                let(:line) { 2 }
                
                it 'increments index' do
                    expect { subject }.not_to change(day_eight, :acc)
                    expect(day_eight.index).to eq 4
                end

                context 'with negative jmp instruction' do
                    let(:line) { 4 }

                    it 'decrements index' do
                        day_eight.index = 4
                        expect { subject }.not_to change(day_eight, :acc)
                        expect(day_eight.index).to eq 1
                    end
                end
            end
        end
    end

    describe '#substitute_operation' do
        subject { day_eight.substitute_operation(line) }
        let(:day_eight) { described_class.new(input, part) }
        let(:input) { ["nop +0",
                        "acc +1",
                        "jmp +4",
                        "acc +3",
                        "jmp -3",
                        "acc -99",
                        "acc +1",
                        "jmp -4",
                        "acc +6"] }
        let(:part) { 2 }
        context 'line 0' do
            let(:line) { 0 }
            it 'changes a nop into a jmp' do
                subject
                expect(day_eight.input[line]).to eq 'jmp +0'
            end
        end
    end
end