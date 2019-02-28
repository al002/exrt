require 'json'
require "exrt/version"
require 'exrt/http'

module Exrt
  class Rate
    def self.latest(base: "USD", symbols: [])
      response = Exrt::Http.get("/latest", { base: base, symbols: symbols_str(symbols) })
      to_json(response.body)
    end

    def self.history(base: "USD", symbols: [], start_at:, end_at:)
      response = Exrt::Http.get("/history", {
        base: base,
        symbols: symbols_str(symbols),
        start_at: start_at,
        end_at: end_at,
      })
      to_json(response.body)
    end

    private
    def self.symbols_str(symbols)
      symbols.join(",")
    end

    def self.to_json(resp)
      JSON.parse(resp)
    end
  end
end
