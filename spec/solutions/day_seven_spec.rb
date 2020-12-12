require 'spec_helper'
require './solutions/day_seven'

RSpec.describe DaySeven do
    describe '.run' do
        subject { described_class.run(part) }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 155 }
        end

        context 'when part 2' do
            let(:part) { 2 }

            it { is_expected.to eq 49086 }
        end
    end

    describe '#process' do
        subject { described_class.new(input, part).process }
        let(:input) { ["light red bags contain 1 bright white bag, 2 muted yellow bags.",
        "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
        "bright white bags contain 1 shiny gold bag.",
        "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
        "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
        "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
        "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
        "faded blue bags contain no other bags.",
        "dotted black bags contain no other bags."] }

        context 'part 1' do
            let(:part) { 1 }
            it { is_expected.to eq 4 }
        end

        context 'when part 2' do
            let(:part) { 2 }
            let(:input) { ["shiny gold bags contain 2 dark red bags.",
            "dark red bags contain 2 dark orange bags.",
            "dark orange bags contain 2 dark yellow bags.",
            "dark yellow bags contain 2 dark green bags.",
            "dark green bags contain 2 dark blue bags.",
            "dark blue bags contain 2 dark violet bags.",
            "dark violet bags contain no other bags."] }

            it { is_expected.to eq 126 }
        end
    end

    describe '#find_bags_containing' do
        subject { described_class.new(input, part).find_bags_containing(bag) }
        let(:part) { 1 }
        let(:input) { ["light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "bright white bags contain 1 shiny gold bag.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
            "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
            "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
            "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
            "faded blue bags contain no other bags.",
            "dotted black bags contain no other bags."] }

        let(:bag) { 'shiny gold' }
        it 'finds bags containing shiny gold bag' do
            is_expected.to include('bright white')
            is_expected.to include('muted yellow')
        end

        context 'with muted yellow' do
            let(:bag) { 'muted yellow' }

            it 'find bags for muted yellow' do
                is_expected.to include('dark orange')
                is_expected.to include('light red')
            end
        end
    end

    describe '#find_bags' do
        subject { described_class.new(input, part).find_bags_within(bag) }
        let(:part) { 1 }
        let(:input) { ["light red bags contain 1 bright white bag, 2 muted yellow bags.",
            "dark orange bags contain 3 bright white bags, 4 muted yellow bags.",
            "bright white bags contain 1 shiny gold bag.",
            "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.",
            "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.",
            "dark olive bags contain 3 faded blue bags, 4 dotted black bags.",
            "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.",
            "faded blue bags contain no other bags.",
            "dotted black bags contain no other bags."] }

        let(:bag) { 'shiny gold' }

        it 'finds bags containing shiny gold bag' do
            is_expected.to include(['1', 'dark olive'])
            is_expected.to include(['2', 'vibrant plum'])
        end
    end
end