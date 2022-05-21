require 'active_support/all'
require 'nokogiri'
require 'open-uri'
require_relative 'lib/club'

module Helpers
  extend ActiveSupport::NumberHelper
end

BASE_URL = 'https://www.transfermarkt.com'.freeze

# url = 'https://www.transfermarkt.com/zenit-st-petersburg/startseite/verein/964?saison_id=2021

url = "#{BASE_URL}/premier-liga/tabelle/wettbewerb/RU1?saison_id=2021"

clubs = Transfermarkt.clubs_by_league(url)
sorted_clubs =
  clubs.sort_by do |club|
    club.fetch_players!
    -club.cost
  end

sum_price = 0
sorted_clubs.each do |club|
  price_string = Helpers.number_to_delimited(club.cost, delimiter: ' ')
  sum_price += club.cost
  puts "#{club.place}: #{club.title}, €#{price_string}\n\n"
end
puts "Стоимость российского футбола: €#{Helpers.number_to_delimited(sum_price, delimiter: ' ')}"
