require 'spec_helper'
require './solutions/day_zero'

RSpec.describe DayZero do
    describe '.run' do
        subject { described_class.run }

        it { is_expected.to eq 'hello' }
    end
end