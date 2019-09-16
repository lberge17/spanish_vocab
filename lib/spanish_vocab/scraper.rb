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
    
    #the topic_array adds attributes to instances of the Topic class
    #the vocabulary array contained in the topic array from the above method will be filled in with instances in Vocab
    #those Vocab instances will get their attributes from the method below
    
    def self.scrape_vocab(url)
      doc = Nokogiri::HTML(open(url))
      vocab_array = []

      doc.css("table:first tbody tr").each_with_index do |block, index|
        if (block.css("td")[0]) != nil && (block.css("td")[1]) != nil
          vocab_array << {:translation => block.css("td")[0].text,
            :spanish => block.css("td")[1].text
          }
        end
      end
      vocab_array
    end
    
  end
end