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

    def self.scrape_vocab(url)
      doc = Nokogiri::HTML(open(url))

      doc.css("table:first tbody tr").map do |block|
        {:translation => block.css("td")[0].text,
            :spanish => block.css("td")[1].text
          }
      end

    end
    
    def self.scrape_time_vocab(url)
      doc = Nokogiri::HTML(open(url))
      vocab_array = []

      doc.css("table:first tbody tr").map do |block|
        if block.css("td")[0] && block.css("td")[1]
          vocab_array << {:translation => block.css("td")[1].text,
            :spanish => block.css("td")[0].text
            }
        end
      end
      vocab_array
    end

  end
end
