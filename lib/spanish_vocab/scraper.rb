require 'nokogiri'
require 'open-uri'

module SpanishVocab
  class Scraper

    def self.scrape(url)

      doc = Nokogiri::HTML(open(url))
      topic_array = []

      doc.css(".content table a").each do |block|
        if block.text != "Time, days, months"
          topic = block.text
          link = block.attribute("href").value
          topic_array << {:name => topic, :link => link, :vocabulary => []}
        end
      end
      topic_array
    end

    def self.scrape_vocab(url)
      doc = Nokogiri::HTML(open(url))

      doc.css("table:first tbody tr").map do |block|
        {:translation => block.css("td")[0].text,
            :spanish => block.css("td")[1].text
          }
      end

    end

  end
end
