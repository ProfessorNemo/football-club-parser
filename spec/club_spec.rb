require 'transfermarkt'
require File.join(Dir.pwd, 'main').sub('spec/', '')

describe Transfermarkt::Club do
  let(:club) do
    Transfermarkt::Club.new(
      title: 'Zenit St. Petersburg',
      path: '/zenit-st-petersburg/startseite/verein/964/saison_id/2021',
      place: 1
    )
  end

  describe '#fetch_players!' do
    it 'fetches players from page' do
      club.fetch_players!

      expect(club.fetch_players.count).to eq 22
      expect(club.fetch_players[1][:name]).to eq 'Mikhail Kerzhakov'
      expect(club.fetch_players.first[:price]).to eq 2_000_000
    end
  end
end
