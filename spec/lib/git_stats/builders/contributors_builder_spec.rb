require 'spec_helper'
require './lib/git_stats/builders/contributors_builder'

describe ContributorsBuilder do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/contributors.json')) }
  let(:repository) { Faker::App.name }
  subject { ContributorsBuilder.new repository: repository, json: json }

  context 'parse Github contributors json' do
    it 'returns Contributors model class' do
      expect(subject.parse).to be_an_instance_of(Contributors)
    end

    it 'fill contributors' do
      expect(subject.parse.contributors.size).to eq(1)
    end

    it 'fill repository' do
      expect(subject.parse.repository).to eq(repository)
    end

    context 'contributor' do
      it 'fill total commits' do
        expect(subject.parse.contributors.first.total_commits).to eq(135)
      end

      it 'fill author' do
        expect(subject.parse.contributors.first.author).not_to be_nil
        expect(subject.parse.contributors.first.author.class).to eq(Author)
      end
    end
  end
end
