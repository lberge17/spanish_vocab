module SpanishVocab
  class CLI
    def run
      make_topics
      add_vocab
      puts "Hope you're ready to learn some Spanish!"
      list_topics
      command
    end
    
    def command
      loop do
        puts ""
        puts "What topic would you like to view? Type list to see options again."
        input = gets.chomp

        if input.to_i.between?(1, 17)
          display_vocab(input.to_i - 1)
        elsif input == "list"
          list_topics
        elsif input == "study"
          flashcards
        elsif input == "quiz"
          quiz
        elsif input == "exit"
          break
        else
          puts "I'm sorry, I don't think I understood."
        end
      end
    end
    
    def list_topics
      puts ""
      Topic.all.each_with_index{|topic, index| puts "Type #{index + 1} for #{topic.name}"}
      puts "Type 'study' to test your knowledge with flashcard mode"
      puts "Type 'quiz' to take a quiz on 10 random vocab words"
      puts "Type 'exit' to exit the program"
      puts ""
    end
    
    def display_vocab(n)
      SpanishVocab::Topic.all[n].vocabulary.each do |vocab|
        puts "#{vocab.translation} - #{vocab.spanish}"
      end
    end
    
    def flashcards
      puts "Welcome to flashcard mode:"
      loop do
        puts "Would you like the test words in English or in Spanish? Type 'e' or 's'."
        puts "Note: if you wish to exit this mode you can type 'exit' at any time."
        input = gets.chomp
        if input == "e"
          english_flashcards
        elsif input == "s"
          puts "Testing your spanish"
          spanish_flashcards
        elsif input == "exit"
          "Exiting test mode."
          break
        else
          puts "Invalid input. Let's try this again."
        end
      end
    end
    
    def english_flashcards
      puts "Enter the number of the topic you want to test your knowledge in:"
      input = gets.chomp.to_i
      SpanishVocab::Topic.all[input - 1].vocabulary.each do |vocab|
        puts "What is #{vocab.translation} in spanish?"
        input = gets.chomp
        if input == "#{vocab.spanish}"
          puts "Correct! Next:"
        elsif input == "exit"
          puts "Exiting test."
          break
        else
          puts "Sorry, the answer was #{vocab.spanish}. Next:"
        end
      end
    end
    
    def spanish_flashcards
      puts "Enter the number of the topic you want to test your knowledge in:"
      input = gets.chomp.to_i
      SpanishVocab::Topic.all[input - 1].vocabulary.each do |vocab|
        puts "What is #{vocab.spanish} in English?"
        input = gets.chomp
        if input == "#{vocab.translation}"
          puts "Correct! Next:"
        elsif input == "exit"
          puts "Exiting test."
          break
        else
          puts "Sorry, the answer was #{vocab.translation}"
        end
      end
    end
    
    def make_topics
      topic_array= SpanishVocab::Scraper.scrape("https://www.e-spanyol.com/basic-spanish-vocabulary.php")
      SpanishVocab::Topic.create_from_collection(topic_array)
    end
    
    def add_vocab
      SpanishVocab::Topic.all.each do |topic|
        topic.add_vocabulary(SpanishVocab::Scraper.scrape_vocab("https://www.e-spanyol.com/" + topic.link))
      end
    end
    
    def quiz
      puts "Welcome to the quiz:"
      puts "Don't stress, this won't go on your report card!"
      
      10.times do 
        vocab = SpanishVocab::Vocab.all[rand(0..901)]
        puts "What is #{vocab.spanish} in English?"
        input = gets.chomp
        if input == "#{vocab.translation}"
          puts "Correct! Next:"
        elsif input == "exit"
          puts "Exiting quiz."
          break
        else
          puts "Sorry, the answer was #{vocab.translation}"
        end
      end
        
      #takes 10 random vocab words and tests the user. At the end shows their score and any they got wrong.
    end
    
  end
end