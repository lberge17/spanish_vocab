module SpanishVocab
  class CLI
    def run
      loading_message
      make_topics
      add_vocab
      list_commands
      main_menu
    end
    
    def loading_message
      puts "Loading application..."
      puts "-----------------------------"
      puts "While you're waiting, get excited to learn some new Spanish vocabulary!"
      puts "With this application, you can learn around 900 Spanish vocab words with vocab lists, flashcards, and a short quiz."
      puts "-----------------------------"
    end

    def main_menu
      loop do
        puts "-----------------------------"
        puts "----------MAIN MENU----------"
        puts "What would you like to do?"
        puts "Type 'options' to see options again."
        input = gets.chomp
        puts ""
        if input.to_i.between?(1, SpanishVocab::Topic.all.size)
          display_vocab(input.to_i - 1)
        elsif input == "options"
          list_commands
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

    def list_commands
      puts "Type 'list' to view and select a topic"
      puts "Type 'study' to test your knowledge with flashcard mode"
      puts "Type 'quiz' to take a quiz on 10 random vocab words"
      puts "Type 'exit' to exit the program"
    end

    def list_topics
      Topic.all.each_with_index{|topic, index| puts "Type #{index + 1} for #{topic.name}"}
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
          flashcard_set("english")
        elsif input == "s"
          flashcard_set("spanish")
        elsif input == "exit"
          "Exiting flashcard mode."
          break
        else
          puts "Invalid input. Let's try this again."
        end
      end
    end

    def flashcard_set(language)
      puts "Enter the number of the topic you want to test your knowledge in:"
      puts "If you can't remember the numbers, type list to see topics."
      input = gets.chomp 
      if input == "exit"
        puts "Back to flashcard menu:"
      elsif input == "list"
        list_topics
        flashcard_set(language)
      elsif input.to_i.between?(1, SpanishVocab::Vocab.all.size)
        SpanishVocab::Topic.all[input.to_i - 1].vocabulary.each do |vocab|
          if language == "english"
            question = vocab.translation
            answer = vocab.spanish
          else
            question = vocab.spanish
            answer = vocab.translation
          end
          puts "How do you say #{question}?"
          input = gets.chomp
          if input == "#{answer}"
            puts "Correct! Next:"
          elsif input == "exit"
            puts "Back to flashcard menu:"
            break
          else
            puts "Sorry, the answer was #{answer}. Next:"
          end
        end
      else
        puts "Invalid input. Let's try this again."
        flashcard_set(language)
      end
    end

    def make_topics
      topic_array = SpanishVocab::Scraper.scrape("https://www.e-spanyol.com/basic-spanish-vocabulary.php")
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
      puts "To leave quiz mode you can type 'exit' at any point"
      loop do
        puts ""
        puts "Starting new quiz..."
        puts "Would you like to view the words in English or Spanish? Type 'e' or 's'"
        input = gets.chomp
        if input == 'e'
          quiz_in_english
        elsif input =='s'
          quiz_in_spanish
        elsif input == 'exit'
          break
        else
          puts "Invalid input. Let's try this again."
        end
      end
    end

    def quiz_in_english #need to refactor this with quiz in spanish
      count = 0
      review = []
      10.times do
        vocab = SpanishVocab::Vocab.all[rand(0...SpanishVocab::Vocab.all.size)]
        puts ""
        puts "What is #{vocab.translation} in Spanish?"
        input = gets.chomp
        if input == "#{vocab.spanish}"
          count += 1
        elsif input == "exit"
          puts "Exiting quiz."
          break
        else
          review << vocab.spanish
        end
      end
      puts ""
      puts "You got #{count} out of 10 questions correct."
      if count != 10
        puts ""
        puts "You might want to review: #{review.join(", ")}"
      end
    end

    def quiz_in_spanish
      count = 0
      review = []
      10.times do
        vocab = SpanishVocab::Vocab.all[rand(0...SpanishVocab::Vocab.all.size)]
        puts ""
        puts "What is #{vocab.spanish} in English?"
        input = gets.chomp
        if input == "#{vocab.translation}"
          count += 1
        elsif input == "exit"
          puts "Exiting quiz."
          break
        else
          review << vocab.translation
        end
      end
      puts ""
      puts "You got #{count} out of 10 questions correct."
      if count != 10
        puts ""
        puts "You might want to review: #{review.join(", ")}"
      end
    end
    
  end
end