module SpanishVocab
  class CLI
    def run
      make_topics
      add_vocab
      puts "Welcome to the SpanishVocab app"
      puts "Hope you're ready to learn some Spanish!"
      #puts "Or you can be tested on them"
      #puts "Or you can exit at any time"
      #puts "What would you like to do?"
      #gets input
      #puts "Executing what you want"
      #loops until a user exits
    end
    
    def list_topics
      #list all topics
    end
    
    def display_vocab
      #display vocab based on topic selected
    end
    
    def test
      #testing vocab in english or in spanish
    end
    
    def make_topics
      topic_array= SpanishVocab::Scraper.scrape("https://www.e-spanyol.com/basic-spanish-vocabulary.php")
      SpanishVocab::Topic.create_from_collection(topic_array)
    end
    
    def add_vocab
      SpanishVocab::Topic.all.each do |topic|
        vocab_array = SpanishVocab::Scraper.scrape_vocab("https://www.e-spanyol.com/" + topic.link)
        topic.vocabulary << SpanishVocab::Vocab.create_from_collection(vocab_array)
      end
    end
    
  end
end