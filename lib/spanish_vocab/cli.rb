module SpanishVocab
  class CLI
    def run
      puts "Welcome to the SpanishVocab app"
      puts "Hope you're ready to learn some Spanish!"
      make_topics
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
      #uses Scraper to make the topics
      SpanishVocab::Topic.create_from_collection(SpanishVocab::Scraper.scrape("https://www.e-spanyol.com/basic-spanish-vocabulary.php"))
      Topic.all.each{|topic| puts topic.name}
    end
    
    def add_vocab
      #adds vocab using second scraper
    end
    
  end
end