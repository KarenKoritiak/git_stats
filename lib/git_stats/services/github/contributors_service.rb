require 'json'
require_relative 'client_service'

module Github
  class ContributorsService < ClientService
    attr_reader :owner, :repository

    def initialize(owner:, repository:)
      @owner = owner
      @repository = repository
    end

    private

    def endpoint
      "#{ENV['GITHUB_API']}/repos/#{owner}/#{repository}/stats/contributors"
    end

    def handle_response(response)
      raise 'Could not request contributors stats' unless response.is_a? Net::HTTPOK
      JSON.parse response.body
    end
  end
end
