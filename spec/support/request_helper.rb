module Requests
  module JsonHelpers
    def json_response
      @json ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  # Our headers helpers module
  module HeadersHelpers
    def request_headers
      @headers ||= {}
    end

    def api_header(version = 1)
      request_headers['Accept'] = "application/vnd.api-v#{version}"
    end

    def api_response_format(format = Mime[:json].symbol)
      request_headers['Accept'] = "#{request_headers['Accept']}+#{format}"
      request_headers['Content-Type'] = 'application/json'
    end

    def include_default_accept_headers
      api_header
      api_response_format
    end
  end
end
