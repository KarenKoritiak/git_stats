require 'spec_helper'
require './lib/git_stats/services/github/user_service'

describe Github::UserService do
  subject do
    Github::UserService.new login: 'octocat'
  end

  let(:user_fixture) { File.read('./spec/fixtures/github/user.json') }
  let(:user_json) { JSON.parse(File.read('./spec/fixtures/github/user.json')) }

  context 'successful request' do
    it 'returns user json' do
      response = Net::HTTPOK.new(1.0, 200, 'OK')
      expect_any_instance_of(
        Net::HTTPOK
      ).to receive(:body).and_return(user_fixture)

      expect_any_instance_of(
        described_class
      ).to receive(:process_request).and_return(response)

      expect(subject.call).to eq(user_json)
    end
  end

  context 'failure request' do
    it 'raise error' do
      response = Net::HTTPAccepted.new(1.0, 202, 'Accepted')

      expect_any_instance_of(
        described_class
      ).to receive(:process_request).and_return(response)

      expect { subject.call }.to raise_error('Could not request user details')
    end
  end
end
