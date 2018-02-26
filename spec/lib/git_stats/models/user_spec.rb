require 'spec_helper'
require './lib/git_stats/models/user'

describe User do
  describe '#attrs_parser' do
    subject { User.new }

    it 'returns parser attributes list' do
      expect(subject.attrs_parser).to eq(%w[name email])
    end
  end
end
