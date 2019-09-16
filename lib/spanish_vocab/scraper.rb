require 'nokogiri'
require 'open-uri'

module SpanishVocab
  class Scraper
    
    def self.scrape(url)

      doc = Nokogiri::HTML(open(url))
      topic_array = []

      doc.css(".content table a").each do |block|
        topic = block.text
        link = block.attribute("href").value
        topic_array << {:name => topic, :link => link, :vocabulary => []}
      end
      topic_array
    end
    
  end
end