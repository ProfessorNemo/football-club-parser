dir_path_club = File.join(Dir.pwd, 'lib', 'club').sub('spec/', '')
dir_path_transfermarkt = File.join(Dir.pwd, 'lib', 'transfermarkt').sub('spec/', '')
dir_path_main = File.join(Dir.pwd, 'main').sub('spec/', '')
require dir_path_club
require dir_path_transfermarkt
require dir_path_main

describe Transfermarkt::Club do
  before do
    @club = described_class.new(
      title: 'Zenit St. Petersburg',
      path: '/zenit-st-petersburg/startseite/verein/964/saison_id/2019',
      place: 1
    )
  end

  describe '#fetch_players!' do
    it 'fetches players from page' do
      @club.fetch_players!

      expect(@club.fetch_players.count).to eq 39
      expect(@club.fetch_players.first[:name]).to eq 'Andrey Lunev'
      expect(@club.fetch_players.first[:price]).to eq 7_000_000
    end
  end
end
