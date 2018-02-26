require 'net/http'

module Github
  class ClientService
    def call
      response = process_request
      handle_response response
    end

    private

    WAITING_PROCESS_SECONDS = 2
    WAITING_PROCESS_RETRIES = 3

    def endpoint
      raise NotImplementedError, 'You must implement endpoint.'
    end

    def handle_response(_response)
      raise NotImplementedError, 'You must implement handle_response.'
    end

    def process_request
      uri = URI.parse(endpoint)
      request = Net::HTTP::Get.new(uri.request_uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'

      execute_request http: http, request: request
    end

    def execute_request(http:, request:)
      retries = WAITING_PROCESS_RETRIES
      processing_job = true
      while processing_job && retries > 0
        response = http.request(request)
        return response unless response.is_a? Net::HTTPAccepted
        sleep WAITING_PROCESS_SECONDS
        retries -= 1
      end
    end
  end
end
