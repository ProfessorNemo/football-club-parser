module Transfermarkt
  def self.clubs_by_league(league_url)
    html = URI.parse(league_url).read

    document = Nokogiri::HTML(html)

    document.css('.responsive-table table > tbody > tr').map do |tr_node|
      Club.new(
        path: tr_node.at('.hauptlink a')['href'].gsub('spielplan', 'startseite'),
        title: replace_nbsp_with_space(tr_node.css('.hauptlink')[1].text).strip,
        # title: tr_node.css('.zentriert a').children[0].attributes['alt'].value
        place: tr_node.at('.rechts').text.to_i
      )
    end
  end

  def self.replace_nbsp_with_space(name)
    name.gsub(' ', ' ')
  end
end
