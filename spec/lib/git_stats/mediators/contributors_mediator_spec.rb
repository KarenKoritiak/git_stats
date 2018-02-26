require 'spec_helper'
require './lib/git_stats/mediators/contributors_mediator'

describe ContributorsMediator do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/contributors.json')) }
  let(:user) { UserBuilder.new(JSON.parse(File.read('./spec/fixtures/github/user.json'))).parse }
  let(:csv_path) { Faker::File.file_name('public', 'random', 'txt') }
  subject { ContributorsMediator.new owner: Faker.name, repository: Faker::App.name }

  it 'retuns User model instance' do
    expect_any_instance_of(described_class).to receive(:service_step).and_return(json)
    expect_any_instance_of(UserMediator).to receive(:user_details).and_return(user)
    expect_any_instance_of(described_class).to receive(:csv_step!).and_return(csv_path)
    subject.generate_csv
  end
end
