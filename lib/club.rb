require 'date'
require_relative 'transfermarkt'

module Transfermarkt
  class Club
    attr_accessor :title, :path, :place, :price, :fetch_players, :page

    def initialize(title:, path:, place:)
      @title = title
      @path = path
      @place = place
    end

    def fetch_page!
      @fetch_page ||= URI.parse("#{::BASE_URL}#{path}").read
    end

    def fetch_players!
      @fetch_players ||= begin
        document = Nokogiri::HTML(fetch_page!)
        document.css('table.items > tbody > tr').map do |tr_node|
          {
            name: tr_node.at('.inline-table .hide-for-small').text,
            price: price_to_int(tr_node.at('.rechts.hauptlink').text),
            date: Date.parse(tr_node.css('.zentriert')[1].text)
          }
        end
      end
    end

    def cost
      @fetch_players.sum { |player| player[:price] }
    end

    private

    def price_to_int(price)
      return ''.to_i if price.size == 1

      # "€10.50m  " -> 10_500_000
      price = price.gsub(/[^€\d.a-z A-Z]/, '')

      raise ArgumentError, "Expected price in euros, got #{price}" unless price[0] == '€'

      price = price[1..]

      price.to_f * magnitude_to_integer(price.gsub(/\W+/, '').gsub(/\d+/, ''))
    end

    def magnitude_to_integer(s)
      return 1_000_000 if s == 'm'
      return 1_000 if s == 'Th'

      raise ArgumentError, "Expected m or k, got #{s}"
    end
  end
end
