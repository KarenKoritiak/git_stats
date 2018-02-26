require 'spec_helper'
require './lib/git_stats/models/author'

describe Author do
  describe '#attrs_parser' do
    subject { Author.new }

    it 'returns parser attributes list' do
      expect(subject.attrs_parser).to eq(%w[login avatar_url])
    end
  end
end
