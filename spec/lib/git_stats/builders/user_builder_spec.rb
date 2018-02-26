require 'spec_helper'
require './lib/git_stats/builders/user_builder'

describe UserBuilder do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/user.json')) }
  subject { UserBuilder.new json }

  context 'parse Github user json' do
    it 'returns User model class' do
      expect(subject.parse).to be_an_instance_of(User)
    end

    it_behaves_like 'parsed instance', %w[name email]
  end
end
