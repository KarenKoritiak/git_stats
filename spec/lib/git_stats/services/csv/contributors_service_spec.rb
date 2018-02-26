require 'spec_helper'
require './lib/git_stats/services/csv/contributors_service'

describe Csv::ContributorsService do
  let(:json) { JSON.parse(File.read('./spec/fixtures/github/contributors.json')) }
  let(:repository) { Faker::App.name }
  let(:contributors) { ContributorsBuilder.new(repository: repository, json: json).parse }

  subject do
    Csv::ContributorsService.new(
      repository: repository, contributors: contributors
    )
  end

  it 'generates csv and returns file path' do
    expect_any_instance_of(described_class).to receive(:generate_file!)
    expect(subject.generate!).not_to be_nil
  end
end
