require 'spec_helper'
require './lib/git_stats/services/github/contributors_service'

describe Github::ContributorsService do
  subject do
    Github::ContributorsService.new owner: Faker.name, repository: Faker::App.name
  end

  let(:contributors_fixture) { File.read('./spec/fixtures/github/contributors.json') }
  let(:contributors_json) { JSON.parse(File.read('./spec/fixtures/github/contributors.json')) }

  context 'successful request' do
    it 'returns contributors json' do
      response = Net::HTTPOK.new(1.0, 200, 'OK')
      expect_any_instance_of(
        Net::HTTPOK
      ).to receive(:body).and_return(contributors_fixture)

      expect_any_instance_of(
        described_class
      ).to receive(:process_request).and_return(response)

      expect(subject.call).to eq(contributors_json)
    end
  end

  context 'failure request' do
    it 'raise error' do
      response = Net::HTTPAccepted.new(1.0, 202, 'Accepted')

      expect_any_instance_of(
        described_class
      ).to receive(:process_request).and_return(response)

      expect { subject.call }.to raise_error('Could not request contributors stats')
    end
  end
end
