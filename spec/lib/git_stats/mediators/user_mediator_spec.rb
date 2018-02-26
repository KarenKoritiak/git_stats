require 'spec_helper'
require './lib/git_stats/mediators/user_mediator'

describe UserMediator do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/author.json')) }
  subject { UserMediator.new login: 'octocat' }

  before :each do
    expect_any_instance_of(described_class).to receive(:service_step).and_return(json)
  end

  it 'retuns User model instance' do
    expect(subject.user_details).to be_an_instance_of(User)
  end

  it 'uses builder to create model' do
    expect_any_instance_of(UserBuilder).to receive(:parse)
    subject.user_details
  end
end
