require 'spec_helper'
require './lib/git_stats/builders/author_builder'

describe AuthorBuilder do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/author.json')) }
  subject { AuthorBuilder.new json }

  context 'parse Github author json' do
    it 'returns Author model class' do
      expect(subject.parse).to be_an_instance_of(Author)
    end

    it_behaves_like 'parsed instance', %w[login avatar_url]
  end
end
