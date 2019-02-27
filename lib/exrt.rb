require "exrt/version"
require "exrt/http"

module Exrt
  class Rate
    def self.latest(base: "USD", symbols: [])
      response = Http.get("/latest", { base: base, symbols: symbols_str(symbols) })
      response.body
    end

    def self.history(base: "USD", symbols: [], start_at:, end_at:)
      response = Http.get("/history", {
        base: base,
        symbols: symbols_str(symbols),
        start_at: start_at,
        end_at: end_at,
      })
      response.body
    end

    def self.symbols_str(symbols)
      symbols.join(",")
    end
  end
end
