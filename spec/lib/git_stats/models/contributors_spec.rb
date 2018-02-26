require 'spec_helper'
require './lib/git_stats/models/contributors'

describe Contributors do
  describe '#attrs_parser' do
    subject { Contributors.new }

    it 'returns parser attributes list' do
      expect(subject.attrs_parser).to eq([])
    end
  end
end

describe Contributor do
  describe '#attrs_parser' do
    subject { Contributor.new }

    it 'returns parser attributes list' do
      expect(subject.attrs_parser).to eq([])
    end
  end
end
