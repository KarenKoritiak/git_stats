require 'json'
require_relative 'client_service'

module Github
  class UserService < ClientService
    attr_reader :login

    def initialize(login:)
      @login = login
    end

    private

    def endpoint
      "#{ENV['GITHUB_API']}/users/#{login}"
    end

    def handle_response(response)
      raise 'Could not request user details' unless response.is_a? Net::HTTPOK
      JSON.parse response.body
    end
  end
end
